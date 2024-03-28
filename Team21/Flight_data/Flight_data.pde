PFont arial;
Map map;
void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  arial = loadFont("Arial-BoldMT-14.vlw");
  textFont(arial);
  textAlign(CENTER, CENTER);

  rectMode(CENTER);

  fill(0);
  
  map = new Map(0, 0);
  
  //String[] flightInfo = readData();
}

void draw() {
  background(255);
  map.draw();
  float[] cords1 = map.getLocationCoordinates("LAX\"Los Angeles");
  float[] cords2 = map.getLocationCoordinates("JFK\"New York");
  line(cords1[0], cords1[1], cords2[0], cords2[1]);
} 

String[] readData() {
  String[] flightData = loadStrings("flights100k.csv");
  return flightData;
}

void mousePressed(){
  print("MouseX: " + mouseX + "\n");
  print("MouseY: " + mouseY + "\n");
}


/*
// Parameters: ArrayList of datapoints you want to sort, String name of variable
void sortFlightsNumerically(ArrayList<Datapoint> flights, String variable) {
  switch (variable) {
    case "intArrivalTime":
      quickSortByIntArrivalTime(flights, 0, flights.size() - 1);
      break;
    case "CRSDepTime":
      quickSortByCRSDepTime(flights, 0, flights.size() - 1);
      break;
    default:
      println("Invalid variable name");
      break;
  }
}
*/
