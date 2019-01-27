JSONObject example;
JSONArray features;
JSONObject area;


void loadData(){
  // Load image
  background = loadImage("data/maparea.png");
  background.resize(width, height);

  // Full area data
  area = loadJSONObject("data/area.json");
  features = area.getJSONArray("features");
}

void parseData(){
  JSONObject feature = features.getJSONObject(6);
  
  for(int i = 0; i<features.size(); i++) {
    // ID 3 main types (point, line, poly) of things in feature
    String type = features.getJSONObject(i).getJSONObject("geometry").getString("type");
    // Pull geometries and properties of each part of feature
    JSONObject geometry = features.getJSONObject(i).getJSONObject("geometry");
    JSONObject properties =  features.getJSONObject(i).getJSONObject("properties");
    
    String amenity = features.getJSONObject(i).getJSONObject("properties").getJSONObject("tags").getString("amenity");
    
    if(amenity != null){
      if(amenity.equals("place_of_worship")){
        if(type.equals("Point")){
          // Create new POI (from POI class defined in B_POI)
          float lat = geometry.getJSONArray("coordinates").getFloat(1);
          float lon = geometry.getJSONArray("coordinates").getFloat(0);
          
          String religion = properties.getJSONObject("tags").getString("religion");
          
          POI poi = new POI(lat, lon, religion);
          pois.add(poi);
        }
      }
    }
     if(amenity != null){
       if(amenity.equals("place_of_worship")){
         if(type.equals("Polygon")){
          // Create new Polygon
          ArrayList<PVector> coords = new ArrayList<PVector>();
          JSONArray coordinates = geometry.getJSONArray("coordinates").getJSONArray(0);
          String religion = properties.getJSONObject("tags").getString("religion");
          for(int j = 0; j < coordinates.size(); j++){
           float lat = coordinates.getJSONArray(j).getFloat(1);
           float lon = coordinates.getJSONArray(j).getFloat(0);
           
           PVector coordinate = new PVector(lat, lon);
           coords.add(coordinate);
          }
          Polygon poly = new Polygon(coords, religion);
          polygons.add(poly);
         }
       }
     }
   //if(type.equals("LineString")){
   // ArrayList<PVector> coords = new ArrayList<PVector>();
   // JSONArray coordinates = geometry.getJSONArray("coordinates");
   // for(int j = 0; j < coordinates.size(); j++){
   //  float lat = coordinates.getJSONArray(j).getFloat(1);
   //  float lon = coordinates.getJSONArray(j).getFloat(0);
     
   //  PVector coordinate = new PVector(lat, lon);
   //  coords.add(coordinate);
   // }
   // Way way = new Way(coords);
   // ways.add(way);
   //}
  }
}
