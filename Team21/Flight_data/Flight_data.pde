PFont arial;
boolean printed;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  printed = false;
  arial = createFont("Arial-BoldMT", 14);
  textFont(arial);
  textAlign(CENTER, CENTER);

  rectMode(CENTER);

  fill(0);
  
  String[] flightInfo = readData();
}

void draw() {
  background(255);
  String [] flightInfo = readData();

}

String[] readData() {
  String[] flightData = loadStrings("flights100k.csv");
  return flightData;
}

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
