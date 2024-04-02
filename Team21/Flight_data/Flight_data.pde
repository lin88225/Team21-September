PFont arial;
boolean printed;

void settings() {
  size(SCREENX, SCREENY);
}
AirlinerProfile American;
void setup() {
  printed = false;
  arial = createFont("Arial-BoldMT", 14);
  textFont(arial);
  textAlign(CENTER, CENTER);
  fill(0);

  //String[] flightInfo = readData();


  American = new AirlinerProfile ("AA");
}

void draw() {
  background(0);
  American.draw();
}

String[] readData() {
  String[] flightData = loadStrings("flights100k.csv");
  if (!printed) {
    for (int i = 0; i < flightData.length; i++) {
      println(flightData[i]);
    }
    printed = true;
  }

  return flightData;
}

void keyPressed() {
  switch (key) {
    //American = new AirlinerProfile ("AA");
  case 'a':
    American = new AirlinerProfile ("AA");
    break;
  case 's':
    American = new AirlinerProfile ("AS");
    break;
  case 'd':
    American = new AirlinerProfile ("B6");
    break;
  case 'f':
    American = new AirlinerProfile ("DL");
    break;
  case 'g':
    American = new AirlinerProfile ("F9");
    break;
  case 'h':
    American = new AirlinerProfile ("G4");
    break;
  case 'j':
    American = new AirlinerProfile ("HA");
    break;
  case 'k':
    American = new AirlinerProfile ("NK");
    break;
  case 'l':
    American = new AirlinerProfile ("UA");
    break;
  default:
    American = new AirlinerProfile ("WN");
    break;
  }
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
