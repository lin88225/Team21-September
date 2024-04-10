String originState = "AK";
String destState = "AK";

class Map {

  float xPosition;
  float yPosition;
  HashMap<String, float[]> locations;
  PImage mapImage;
  float [][] currentLineBeingShown;
  boolean lineDisplayed;

  Map(float xPosition, float yPosition) {
    lineDisplayed = false;
    this.xPosition = xPosition;
    this.yPosition = yPosition;
    mapImage = loadImage("usa-map.jpg");
    setupHashTable();
  }

  void setupHashTable() {
    locations = new HashMap<String, float[]>();
    //locations.put("", new float[] {});
    locations.put("AK", new float[] {89f, 311f});
    locations.put("HI", new float[] {214f, 349f});
    locations.put("WA", new float[] {72f, 37f});
    locations.put("OR", new float[] {62f, 83f});
    locations.put("CA", new float[] {55f, 185f});
    locations.put("ID", new float[] {119f, 96f});
    locations.put("NV", new float[] {82f, 146f});
    locations.put("UT", new float[] {131f, 162f});
    locations.put("AZ", new float[] {123f, 218f});
    locations.put("MT", new float[] {172f, 65f});
    locations.put("WY", new float[] {177f, 113f});
    locations.put("CO", new float[] {189f, 168f});
    locations.put("NM", new float[] {178f, 224f});
    locations.put("ND", new float[] {243f, 60f});
    locations.put("SD", new float[] {246f, 104f});
    locations.put("NE", new float[] {250f, 137f});
    locations.put("KS", new float[] {261f, 178f});
    locations.put("OK", new float[] {266f, 218f});
    locations.put("TX", new float[] {249f, 272f});
    locations.put("MN", new float[] {293f, 77f});
    locations.put("IA", new float[] {305f, 134f});
    locations.put("MO", new float[] {315f, 181f});
    locations.put("AR", new float[] {319f, 223f});
    locations.put("LA", new float[] {318f, 277f});
    locations.put("WI", new float[] {337f, 98f});
    locations.put("IL", new float[] {348f, 160f});
    locations.put("MS", new float[] {346f, 247f});
    locations.put("MI", new float[] {387f, 112f});
    locations.put("IN", new float[] {376f, 156f});
    locations.put("KY", new float[] {392f, 187f});
    locations.put("TN", new float[] {376f, 213f});
    locations.put("AL", new float[] {377f, 256f});
    locations.put("OH", new float[] {406f, 151f});
    locations.put("GA", new float[] {412f, 251f});
    locations.put("SC", new float[] {438f, 231f});
    locations.put("FL", new float[] {440f, 304f});
    locations.put("NC", new float[] {452f, 207f});
    locations.put("VA", new float[] {453f, 178f});
    locations.put("WV", new float[] {427f, 173f});
    locations.put("MD", new float[] {466f, 155f});
    locations.put("DE", new float[] {484f, 158f});
    locations.put("PA", new float[] {454f, 135f});
    locations.put("NJ", new float[] {486f, 141f});
    locations.put("NY", new float[] {474f, 104f});
    locations.put("CT", new float[] {497f, 117f});
    locations.put("RI", new float[] {511f, 116f});
    locations.put("MA", new float[] {509f, 103f});
    locations.put("NH", new float[] {503f, 91f});
    locations.put("VT", new float[] {490f, 81f});
    locations.put("ME", new float[] {515f, 63f});
  }

  void draw() {
    image(mapImage, xPosition, yPosition);
    drawLine(originState, destState);
  }

  float[] getLocationCoordinates(String locationName) {
    float [] cords = new float[] {locations.get(locationName)[0] + xPosition, locations.get(locationName)[1] + yPosition};
    return cords;
  }

  void drawLine(String originState, String destState) {
    float[] cords1 = this.getLocationCoordinates(originState);
    float[] cords2 = this.getLocationCoordinates(destState);
    strokeWeight(3);
    line(cords1[0], cords1[1], cords2[0], cords2[1]);
    strokeWeight(1);
  }
  void setLine(String originState1, String destState1) {
    if (originState!=null && destState != null) {
      originState = originState1;
      destState = destState1;
      this.lineDisplayed = true;
    }
  }
}
