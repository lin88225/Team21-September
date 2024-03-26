PFont arial;

Screen [] screenArray;
Dropdown [] dropdownArray;
String [] airports;
int [] numberFlights;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  arial = loadFont("Arial-BoldMT-14.vlw");
  textFont(arial);
  textAlign(CENTER, CENTER);

  rectMode(CENTER);

  fill(0);

  String[] flightInfo = readData();
  createDropdownArray();
  createScreens();
}

void draw() {
  background(255);
  screenArray[0].draw();
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
