PFont arial;
PFont titleFont;
Screen [] screenArray;
Dropdown [] dropdownArray;
Dropdown [] dropdownArray2;
Dropdown[] wheelDropdown;
String [] flightInfo;
BufferedReader reader;

Query q;
int[] numFlightsAirport;
int[] numFlightsState;
int[] numFlightsCity;
float [] averageFlightDelay;
int [] carbonEmissions = {207, 44, 33, 136, 18, 11, 10, 32, 4};
float [] averageFlightDistance;
String [] arrayDates;
int [][] dailyCityFlights;
int [][] dailyStateFlights;
int [][] dailyAirportFlights;
PImage image;
String [] airports;
String [] states;
String [] cities;
TextWidget text[];
TextWidget focus;
TextWidget focus2;
String startDate="";
String endDate="";

AirlinerProfile profile;


void settings() {
  size(SCREENX, SCREENY);
}
// The code used to use multiple fonts, I went through all  the files and now they are all Gadugi, even if the file names say otherwise - Cara Saulnier

void setup() {
  // Added an image at the top of the screens and changed the colour/shape of widgets to improve the design.
  // K.N.
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
  createOtherDropdown();//dropdown array for screen(7)

  //creates 2 objects of TextWidget class
  text=new TextWidget[2];
  text[0]=new TextWidget(100, SCREENY/2-2*DROPDOWN_HEIGHT+30, 120, 40,
    "from", color(197, 185, 205), color(255), arial, 3, 10);
  text[1]=new TextWidget(100, SCREENY/2-2*DROPDOWN_HEIGHT+80, 120, 40,
    "to", color(197, 185, 205), color(255), arial, 2, 10);
  startDate=text[0].label;
  endDate=text[1].label;
  focus=null;
  focus2=null;

  profile = new AirlinerProfile("AA");
}


void draw() {
  background(255);
  createScreens(currentScreenShown);
  screenArray[currentScreenShown].draw();

  image(image, 0, 0);
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

  int event;
  for (int i = 0; i < text.length; i++) {  //this allows to recognise if we click over a TextWidget - K.N.
    Widget theWidget = (Widget)text[i];
    event = theWidget.getEvent(mouseX, mouseY);
    switch(event) {
    case 3:

      focus= (TextWidget)theWidget;
      focus2=null;
      return;
    case 2:
      focus2= (TextWidget)theWidget;
      focus=null;
      return;
    default:
      focus=null;
      focus2=null;
    }
  }
}

void mouseWheel(MouseEvent event) {
  // Modified body of this method because in this way it can take different dropdown arrays
  // like the one in screen(1) and also on screen(7) even if they have different names
  // K.N.
  if (currentScreenShown==1)
  {
    wheelDropdown=dropdownArray;
  } else if (currentScreenShown==7)
  {
    wheelDropdown=dropdownArray2;
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
  //This method allows a TextWidget label to take what is being inserted - K.N.
  if (focus != null) {
    text[0].append(key);
    startDate=text[0].label;
  }

  if (focus2 != null) {
    text[1].append(key);
    endDate=text[1].label;
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

void keyReleased() {
  switch (key) {
  case '1':
    profile = new AirlinerProfile("AA");
    profile.show = true;

    break;
  case '2':
    profile = new AirlinerProfile("AS");
    profile.show = true;

    break;
  case '3':
    profile = new AirlinerProfile("B6");
    profile.show = true;

    break;
  case '4':
    profile = new AirlinerProfile("DL");
    profile.show = true;

    break;
  case '5':
    profile = new AirlinerProfile("F9");
    profile.show = true;

    break;
  case '6':
    profile = new AirlinerProfile("G4");
    profile.show = true;

    break;
  case '7':
    profile = new AirlinerProfile("HA");
    profile.show = true;
    break;
  case '8':
    profile = new AirlinerProfile("NK");
    profile.show = true;
    break;
  case '9':
    profile = new AirlinerProfile("UA");
    profile.show = true;
    break;
  case '0':
    profile = new AirlinerProfile("WN");
    profile.show = true;
    break;
  default:
    profile.show = false;
    break;
  }
}
