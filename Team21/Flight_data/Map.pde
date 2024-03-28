class Map{
  float xPosition; float yPosition;
  HashMap<String, float[]> locations;
  PImage mapImage;
  
  Map(float xPosition, float yPosition){
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    mapImage = loadImage("usa-map.jpg");
    setupHashTable();
  }
  
  private void setupHashTable(){
    locations = new HashMap<String, float[]>();
    locations.put("", new float[] {});
    //locations.put("LOCATION NAME", new float[] {X CORD, Y CORD});
    locations.put("LAX\"Los Angeles", new float[] {59, 221});
    locations.put("JFK\"New York", new float[] {489, 123});
    locations.put("ORD\"Chicago", new float[] {357, 132});
    locations.put("\"Fort Lauderdale", new float[] {457, 334});
  }
  
  void draw(){
    image(mapImage, xPosition, yPosition);
  }
  
  float[] getLocationCoordinates(String locationName){
    float [] cords = new float[] {locations.get(locationName)[0] + xPosition, locations.get(locationName)[1] + yPosition};
    return cords;
  }
}
