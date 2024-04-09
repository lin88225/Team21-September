BufferedReader reader;
PFont arial;
PFont titleFont;
PImage image;
Query q;
AirlinerProfile profile;
Screen [] screenArray;
Dropdown [] dropdownArray;
Dropdown [] dropdownArrayForDateRange;
Dropdown[] wheelDropdown;
String [] flightInfo;
int[] numFlightsAirport;
int[] numFlightsState;
int[] numFlightsCity;
float [] averageFlightDelay;
float [] averageFlightDistance;
String [] arrayDates;
int [][] dailyCityFlights;
int [][] dailyStateFlights;
int [][] dailyAirportFlights;
String [] airports;
String [] states;
String [] cities;
TextWidget text[];
TextWidget startDateTextWidget;
TextWidget endDateTextWidget;
String startDate="";
String endDate="";

void settings() {
  size(SCREENX, SCREENY);
}
// The code used to use multiple fonts, I went through all  the files and now they are all Gadugi, even if the file names say otherwise - Cara Saulnier

void setup() {
  // Added an image at the top of the screens and changed the colour/shape of widgets to improve the design.
  // Katia Neli
  background(MIMI_PINK);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  arial = loadFont("Arial-BoldMT-14.vlw");
  titleFont = loadFont("Gadugi-Bold-32.vlw");
  //loading screen
  textFont(titleFont);
  text("Please wait as we\nget your data loaded", SCREENX/2, SCREENY/2);
  textFont(arial);
  fill(0);
  //query creation
  flightInfo = readData();
  q= new Query(1, flightInfo.length);
  numFlightsAirport=q.getNumberFlightsPerAirport();
  numFlightsState=q.getNumberFlightsPerState();
  numFlightsCity=q.getNumberFlightsPerCity();
  averageFlightDelay = q.calculateAverageDelay();
  averageFlightDistance = q.averageFlightDistance();
  arrayDates =q.getArrayDates();
  dailyCityFlights = q.getNumberFlightsPerCityForEveryDay();

  dailyStateFlights = q.getNumberFlightsPerStateForEveryDay();
  dailyAirportFlights = q.getNumberFlightsPerAirportForEveryDay();

  airports = q.getArrayAirports();
  states = q.getArrayStates();
  cities = q.getArrayCities();

  screenArray = new Screen [NUMBER_OF_SCREENS];
  image= loadImage("AirTrackr3.png");

  createDropdownArray();
  createFirstScreens();

  //creates 2 objects of TextWidget class
  text=new TextWidget[2];
  text[0]=new TextWidget(100, SCREENY/2-2*DROPDOWN_HEIGHT+30, 120, 40,
    "from", color(197, 185, 205), color(255), arial, 3, 10);
  text[1]=new TextWidget(100, SCREENY/2-2*DROPDOWN_HEIGHT+80, 120, 40,
    "to", color(197, 185, 205), color(255), arial, 2, 10);
  startDate=text[0].label;
  endDate=text[1].label;
  startDateTextWidget=null;
  endDateTextWidget=null;

  profile = new AirlinerProfile("AA");
}

int screenCheck = 0;
void draw() {
  background(255);
  //draws screens
  if (screenCheck != currentScreenShown) {
    createScreens(currentScreenShown);
    screenCheck = currentScreenShown;
  }
  if (currentScreenShown == 6 && !mousePressed){
  createScreens(currentScreenShown);
  }
  screenArray[currentScreenShown].draw();
  if (profile.show) {
    profile.draw();
    profile.mouseDragged();
  }
  textAlign(CENTER, CENTER);
}

String[] readData() {
  String line = null;
  ArrayList <String> file = new ArrayList<>();
  reader = createReader("flights_full.csv");
  try {
    while ((line = reader.readLine()) != null) {
      file.add(line);
    }
    reader.close();
  }
  catch(IOException e) {
    println("exception");
    exit();
  }
  return file.toArray(new String [0]);
}

void mousePressed() {
  screenArray[currentScreenShown].checkButtonsPressed();
  //The portion of code below recognises if we click over a TextWidget - Katia Neli
  int event;
  for (int i = 0; i < text.length; i++) {
    Widget theWidget = (Widget)text[i];
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case 3:
      startDateTextWidget= (TextWidget)theWidget;
      endDateTextWidget=null;
      return;
    case 2:
      endDateTextWidget= (TextWidget)theWidget;
      startDateTextWidget=null;
      return;
    default:
      startDateTextWidget=null;
      endDateTextWidget=null;
    }
  }
}

void mouseWheel(MouseEvent event) {
  // Modified body of this method created by Cara Saulnier because in this way it can take different dropdown arrays
  // like the one in screen(1) and also on screen(7) even if they have different names
  // Katia Neli
  if (currentScreenShown==1)
  {
    wheelDropdown=dropdownArray;
  } else if (currentScreenShown==6)
  {
    wheelDropdown=dropdownArrayForDateRange;
  }

  for (int i =0; i < wheelDropdown.length; i++)
  {
    for (int j =0; j < wheelDropdown[i].dropdownDisplay.length; j++)
    {
      if ((wheelDropdown[i].menuWidgets[j].getEvent(pmouseX, pmouseY) ==1 || wheelDropdown[i].titleWidget.getEvent(pmouseX, pmouseY) ==1) && wheelDropdown[i].clickTitle % 2==0)
      {
        wheelDropdown[i].scroll((int)event.getCount());
      }
    }
  }
}

void keyPressed() {
  //This method allows a TextWidget label to take what is being inserted - Katia Neli
  if (startDateTextWidget != null) {
    text[0].append(key);
    startDate=text[0].label;
  }

  if (endDateTextWidget!= null) {
    text[1].append(key);
    endDate=text[1].label;
  }
}

void keyReleased() {
  //If you press one ot the key indicated below the corresponding airliner profile will appear on the screen
  switch (key) {
  case 'a':
    profile = new AirlinerProfile("AA");
    profile.show = true;
    break;
  case 'b':
    profile = new AirlinerProfile("AS");
    profile.show = true;
    break;
  case 'c':
    profile = new AirlinerProfile("B6");
    profile.show = true;
    break;
  case 'd':
    profile = new AirlinerProfile("DL");
    profile.show = true;
    break;
  case 'e':
    profile = new AirlinerProfile("F9");
    profile.show = true;
    break;
  case 'f':
    profile = new AirlinerProfile("G4");
    profile.show = true;
    break;
  case 'g':
    profile = new AirlinerProfile("HA");
    profile.show = true;
    break;
  case 'h':
    profile = new AirlinerProfile("NK");
    profile.show = true;
    break;
  case 'i':
    profile = new AirlinerProfile("UA");
    profile.show = true;
    break;
  case 'j':
    profile = new AirlinerProfile("WN");
    profile.show = true;
    break;
  default:
    profile.show = false;
    break;
  }
}

// Parameters: ArrayList of datapoints you want to sort, String name of variable
/*void sortFlightsNumerically(ArrayList<Datapoint> flights, String variable) {
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
 }*/
