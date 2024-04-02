PFont arial;
PFont titleFont;
Screen [] screenArray;
Dropdown [] dropdownArray;
String [] airports;
int [] numberFlights;
String [] flightInfo;

Query q;
int[] tempData;
int[] numFlightsAirport;
int[] numFlightsState;
int[] numFlightsCity;
float [] averageFlightDelay;
int [] carbonEmissions = {207, 44, 33, 136, 18, 11, 10, 32, 4};
float [] averageFlightDistance;
PImage image;


void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  background(MIMI_PINK);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  /*
  I added an image at the top of the screens just to improve the design.
   We can change it if you don't like it and the name "AirTrackr" is just provisional.
   Same thing for the colour and shape of the widgets...
   K.N.
   */
  arial = loadFont("Arial-BoldMT-14.vlw");
  titleFont = loadFont("Gadugi-Bold-32.vlw");
  textFont(titleFont);
  text("Please wait as we\nget your data loaded", SCREENX/2, SCREENY/2);
  textFont(arial);
  fill(0);
  flightInfo = readData();
  
  q= new Query(1, 10000);
  tempData = q.getNumberFlightsPerAirport();
  numFlightsAirport=q.getNumberFlightsPerAirport();
  numFlightsState=q.getNumberFlightsPerState();
  numFlightsCity=q.getNumberFlightsPerCity();
  averageFlightDelay = q.calculateAverageDelay();
  averageFlightDistance = q.averageFlightDistance();
  
  screenArray = new Screen [6];
  image= loadImage("AirTrackr2.png");
  createDropdownArray();
  createFirstScreen();
}

void draw() {
  background(255);
  createScreens(currentScreenShown);
  /*
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
   */
  screenArray[currentScreenShown].draw();
  image(image, 0, 0);
  textAlign(CENTER, CENTER);
}

String[] readData() {
  String[] flightData = loadStrings("flights_full.csv");
  return flightData;
}
void mousePressed() {
  screenArray[currentScreenShown].checkButtonsPressed();
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
