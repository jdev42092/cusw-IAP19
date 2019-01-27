// Load JSON Object for full data, array of features, and 
JSONObject example;
JSONArray features;
JSONObject wholeArea;

void loadData(){
  // Load image
  background = loadImage("data/background.png");
  background.resize(width, height);

  // Small example area
  // Load in data and features
  //example = loadJSONObject("data/example.json");
  //features = example.getJSONArray("features");
  //Print line if successfully loaded
  //println("Data loaded");

  // Bigger example area
  wholeArea = loadJSONObject("data/wholeArea.json");
  features = wholeArea.getJSONArray("features");
}

void parseData(){
  JSONObject feature = features.getJSONObject(0);
  // println(feature); // <- Prints one feature

  for(int i = 0; i<features.size(); i++) {
    // ID 3 main types (point, line, poly) of things in feature
    String type = features.getJSONObject(i).getJSONObject("geometry").getString("type");
    // Pull geometries and properties of each part of feature
    JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
    JSONObject properties =  features.getJSONObject(i).getJSONObject("properties");

   if(type.equals("Point")){
     // Create new POI (from POI class defined in B_POI)
     float lat = geometry.getJSONArray("coordinates").getFloat(1);
     float lon = geometry.getJSONArray("coordinates").getFloat(0);

     POI poi = new POI(lat, lon);
     pois.add(poi);
   }

   if(type.equals("Polygon")){
    // Create new Polygon
    ArrayList<PVector> coords = new ArrayList<PVector>();
    JSONArray coordinates = geometry.getJSONArray("coordinates").getJSONArray(0);
    for(int j = 0; j < coordinates.size(); j++){
     float lat = coordinates.getJSONArray(j).getFloat(1);
     float lon = coordinates.getJSONArray(j).getFloat(0);

     PVector coordinate = new PVector(lat, lon);
     coords.add(coordinate);
    }
    Polygon poly = new Polygon(coords);
    polygons.add(poly);
   }

   if(type.equals("LineString")){
    ArrayList<PVector> coords = new ArrayList<PVector>();
    JSONArray coordinates = geometry.getJSONArray("coordinates");
    for(int j = 0; j < coordinates.size(); j++){
     float lat = coordinates.getJSONArray(j).getFloat(1);
     float lon = coordinates.getJSONArray(j).getFloat(0);

     PVector coordinate = new PVector(lat, lon);
     coords.add(coordinate);
    }
    Way way = new Way(coords);
    ways.add(way);
   }
  }
}
