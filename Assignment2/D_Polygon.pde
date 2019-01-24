class Polygon{
  ArrayList<PVector> coordinates;
  String religion;
  color strokeColor;
  PShape p;
  
  Polygon(){
    coordinates = new ArrayList<PVector>();    
  }
  
  Polygon(ArrayList<PVector> coords, String religion) {
   coordinates = coords;
   
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
   makeShape();
  }
  
  void makeShape(){
    p = createShape();
    p.beginShape();
    p.stroke(strokeColor);
    p.strokeWeight(2.5);
    p.noFill();
    for(int i = 0; i<coordinates.size(); i++){
     PVector screenLocation = map.getScreenLocation(coordinates.get(i));
     p.vertex(screenLocation.x, screenLocation.y);
    }
    p.endShape();
  }
  
  void draw(){
   shape(p, 0, 0); 
  }
}
