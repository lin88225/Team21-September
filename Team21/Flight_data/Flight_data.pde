PFont arial;
PFont titleFont;
Screen [] screenArray;
Dropdown [] dropdownArray;
Dropdown [] dropdownArray2;
Dropdown[] wheelDropdown;
String [] airports;
int [] numberFlights;
String [] flightInfo;
BufferedReader reader;

Query q;
int[] tempData;
int[] numFlightsAirport;
int[] numFlightsState;
int[] numFlightsCity;
float [] averageFlightDelay;
int [] carbonEmissions = {207, 44, 33, 136, 18, 11, 10, 32, 4};
float [] averageFlightDistance;
String arrayDates[];
int [][] dailyCityFlights;
int [][] dailyStateFlights;
int [][] dailyAirportFlights;
PImage image;

String [] airport;
String [] states;
String [] cities;

TextWidget text[];
TextWidget focus;
TextWidget focus2;
String startDate="";
String endDate="";

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  // I added an image at the top of the screens and changed the colour/shape of widgets to improve the design.
  // K.N.
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

  q= new Query(1, flightInfo.length);
 // q= new Query(1, 40000); // the amount parameter is less than expected for test purposes

  // airports = q.getArrayAirports();
  // states = q.getArrayStates();
  // cities = q.getArrayCities();
  tempData = q.getNumberFlightsPerAirport();
  numFlightsAirport=q.getNumberFlightsPerAirport();
  numFlightsState=q.getNumberFlightsPerState();
  numFlightsCity=q.getNumberFlightsPerCity();
  averageFlightDelay = q.calculateAverageDelay();
  averageFlightDistance = q.averageFlightDistance();
  arrayDates =q.getArrayDates();
  dailyCityFlights = q.getNumberFlightsPerCityForEveryDay();
  dailyStateFlights = q.getNumberFlightsPerStateForEveryDay();
  ;
  dailyAirportFlights = q.getNumberFlightsPerAirportForEveryDay();
  ;

  //screenArray = new Screen [7];//added a screen
  screenArray = new Screen [8];//added a screen
  image= loadImage("AirTrackr2.png");
  createDropdownArray();
  createFirstScreen();
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
}

void draw() {
  background(255);
  createScreens(currentScreenShown);
  screenArray[currentScreenShown].draw();
  if (currentScreenShown!=0)
    image(image, 0, 0);
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
      println("text widget");
      focus= (TextWidget)theWidget;
      focus2=null;
      return;
    case 2:
      println("text widget");
      focus2= (TextWidget)theWidget;
      focus=null;
      return;
    default:
      println("blah blah");
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
    wheelDropdown=dropdownArray;
  else if (currentScreenShown==7)  wheelDropdown=dropdownArray2;

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

  /*for (int i =0; i < dropdownArray.length; i++)
   {
   for (int j =0; j < dropdownArray[i].dropdownDisplay.length; j++)
   {
   if ((dropdownArray[i].menuWidgets[j].getEvent(pmouseX, pmouseY) ==1 || dropdownArray[i].titleWidget.getEvent(pmouseX, pmouseY) ==1) && dropdownArray[i].clickTitle % 2==0)
   {
   dropdownArray[i].scroll((int)event.getCount());
   }
   }
   }*/
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
