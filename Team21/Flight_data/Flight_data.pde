PFont arial;

PFont titleFont;
Screen [] screenArray;
Dropdown [] dropdownArray;
String [] airports;
int [] numberFlights;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  background(MIMI_PINK);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);

  arial = loadFont("Arial-BoldMT-14.vlw");
  titleFont = loadFont("Gadugi-Bold-32.vlw");
  textFont(titleFont);
  text("Please wait as we\nget your data loaded", SCREENX/2, SCREENY/2);
  textFont(arial);
  fill(0);

  String[] flightInfo = readData();
  createDropdownArray();
  createScreens();
  //q1= new Query1(1, 21);
  //airports=q1.getArrayAirports();
  //numberFlights=q1.getNumberFlightsPerAirport();
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
void mouseWheel(MouseEvent event) {
  for (int i =0; i < dropdownArray.length; i++)
  {
    for (int j =0; j < dropdownArray[i].dropdownDisplay.length; j++)
    {
      if ((dropdownArray[i].menuWidgets[j].getEvent(pmouseX, pmouseY) ==1 || dropdownArray[i].titleWidget.getEvent(pmouseX, pmouseY) ==1) && dropdownArray[i].clickTitle % 2==0)
      {
        dropdownArray[i].scroll((int)event.getCount());
      }
    }
  }
}
