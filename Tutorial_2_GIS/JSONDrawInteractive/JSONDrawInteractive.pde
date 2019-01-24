//First make a blank map 
MercatorMap map;
// Image that we load from data file for background of map
PImage background;

ArrayList<Polygon> polygons;
ArrayList<Way> ways;
ArrayList<POI> pois;

void setup(){
  size(1000, 650);

  //Intiailize your data structures early in setup
  map = new MercatorMap(width, height, 42.3636, 42.3557, -71.1034, -71.0869, 0);
  polygons = new ArrayList<Polygon>();
  ways = new ArrayList<Way>();
  pois = new ArrayList<POI>();

  loadData();
  parseData();
}

void draw(){
  background(255);
  image(background, 0, 0);

  for(int i = 0; i<polygons.size(); i++){
   polygons.get(i).draw();
  }

  for(int i=0; i<pois.size(); i++){
   pois.get(i).draw();
  }

  for(int i = 0; i<ways.size(); i++){
   ways.get(i).draw();
  }
}
