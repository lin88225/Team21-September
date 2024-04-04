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
    //locations.put("", new float[] {});
    locations.put("AK\"Alaska", new float[] {40f, 340f});
    locations.put("HI\"Hawaii", new float[] {54f, 18f});
    locations.put("WA\"Washington", new float[] {90f, 18f});
    locations.put("OR\"Oregon", new float[] {126f, 18f});
    locations.put("CA\"California", new float[] {162f, 18f});
    locations.put("ID\"Idaho", new float[] {198f, 18f});
    locations.put("NV\"Nevada", new float[] {234f, 18f});
    locations.put("UT\"Utah", new float[] {270f, 18f});
    locations.put("AZ\"Arizona", new float[] {306f, 18f});
    locations.put("MT\"Montana", new float[] {342f, 18f});
    locations.put("WY\"Wyoming", new float[] {378f, 18f});
    locations.put("CO\"Colorado", new float[] {200f, 140f});
    locations.put("NM\"New Mexico", new float[] {450f, 18f});
    locations.put("ND\"North Dakota", new float[] {486f, 18f});
    locations.put("SD\"South Dakota", new float[] {522f, 18f});
    locations.put("NE\"Nebraska", new float[] {18f, 54f});
    locations.put("KS\"Kansas", new float[] {54f, 54f});
    locations.put("OK\"Oklahoma", new float[] {90f, 54f});
    locations.put("TX\"Texas", new float[] {126f, 54f});
    locations.put("MN\"Minnesota", new float[] {162f, 54f});
    locations.put("IA\"Iowa", new float[] {198f, 54f});
    locations.put("MO\"Missouri", new float[] {234f, 54f});
    locations.put("AR\"Arkansas", new float[] {270f, 54f});
    locations.put("LA\"Louisiana", new float[] {306f, 54f});
    locations.put("WI\"Wisconsin", new float[] {342f, 54f});
    locations.put("IL\"Illinois", new float[] {378f, 54f});
    locations.put("MS\"Mississippi", new float[] {414f, 54f});
    locations.put("MI\"Michigan", new float[] {450f, 54f});
    locations.put("IN\"Indiana", new float[] {486f, 54f});
    locations.put("KY\"Kentucky", new float[] {522f, 54f});
    locations.put("TN\"Tennessee", new float[] {18f, 90f});
    locations.put("AL\"Alabama", new float[] {54f, 90f});
    locations.put("OH\"Ohio", new float[] {90f, 90f});
    locations.put("GA\"Georgia", new float[] {126f, 90f});
    locations.put("SC\"South Carolina", new float[] {162f, 90f});
    locations.put("FL\"Florida", new float[] {198f, 90f});
    locations.put("NC\"North Carolina", new float[] {234f, 90f});
    locations.put("VA\"Virginia", new float[] {270f, 90f});
    locations.put("WV\"West Virginia", new float[] {306f, 90f});
    locations.put("MD\"Maryland", new float[] {342f, 90f});
    locations.put("DE\"Delaware", new float[] {378f, 90f});
    locations.put("PA\"Pennsylvania", new float[] {414f, 90f});
    locations.put("NJ\"New Jersey", new float[] {450f, 90f});
    locations.put("NY\"New York", new float[] {486f, 90f});
    locations.put("CT\"Connecticut", new float[] {522f, 90f});
    locations.put("RI\"Rhode Island", new float[] {18f, 126f});
    locations.put("MA\"Massachusetts", new float[] {54f, 126f});
    locations.put("NH\"New Hampshire", new float[] {90f, 126f});
    locations.put("VT\"Vermont", new float[] {126f, 126f});
    locations.put("ME\"Maine", new float[] {162f, 126f});
 
}
  
  void draw(){
    image(mapImage, xPosition, yPosition);
    //drawLine(originState, destState);
  }
  
  float[] getLocationCoordinates(String locationName){
    float [] cords = new float[] {locations.get(locationName)[0] + xPosition, locations.get(locationName)[1] + yPosition};
    return cords;
  }
  
  void drawLine(String originState, String destState){
    float[] cords1 = this.getLocationCoordinates(originState);
    float[] cords2 = this.getLocationCoordinates(destState);
    line(cords1[0], cords1[1], cords2[0], cords2[1]);
}

}
