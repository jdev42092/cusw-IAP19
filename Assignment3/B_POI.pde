class POI{
 PVector coord;
 float lat, lon; 
 String religion;
 color strokeColor;
 
 POI(float _lat, float _lon, String religion){
  lat = _lat;
  lon = _lon; 
  coord = new PVector(lat, lon);
  strokeColor = color(255,0,255);
  if(religion != null){
    if(religion.equals("christian")){
    strokeColor = color(128, 0, 0);
    }
    if(religion.equals("jewish")){
    strokeColor = color(0,128,51);
    }
    if(religion.equals("muslim")){
    strokeColor = color(0,51,128);
    }
    if(religion.equals("buddhist")){
    strokeColor = color(96,0,128);
    }
  }
  println(coord, religion, strokeColor);
 }
 
 void draw(){
  PVector screenLocation = map.getScreenLocation(coord);
  noFill();
  stroke(strokeColor); 
  strokeWeight(2);
  ellipse(screenLocation.x, screenLocation.y, 20, 20);
 }
}
