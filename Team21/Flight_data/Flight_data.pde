PFont arial;

PFont titleFont;
Screen [] screenArray;
Dropdown [] dropdownArray;
String [] airports;
int [] numberFlights;
String [] flightInfo;

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

  flightInfo = readData();
  createDropdownArray();
  createScreens();
}

void draw() {
  background(255);
  switch(currentScreenShown)
  {
  case 0:
    screenArray[0].draw();
    break;
  case 1:
    screenArray[1].draw();
    break;
  case 2:
    screenArray[2].draw();
    break;
  case 3:
    screenArray[3].draw();
    break;
  case 4:
    screenArray[4].draw();
    break;
  case 5:
    screenArray[5].draw();
    break;
  default:
    println("error");
  }
}

String[] readData() {
  String[] flightData = loadStrings("flights_full.csv");
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
