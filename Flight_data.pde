PFont arial;
// Heatmap heatmap; // uncomment to apply heatmap
PFont titleFont;
Screen [] screenArray;
Dropdown [] dropdownArray;
Dropdown [] dropdownMap;
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
PImage image;

AirlinerProfile profile;
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
  
  //String[] flightInfo = readData();
  
  // heatmap = new Heatmap(this); // uncomment to apply heatmap

  flightInfo = readData();
  q= new Query(1, flightInfo.length);
  tempData = q.getNumberFlightsPerAirport();
  numFlightsAirport=q.getNumberFlightsPerAirport();
  numFlightsState=q.getNumberFlightsPerState();
  numFlightsCity=q.getNumberFlightsPerCity();
  averageFlightDelay = q.calculateAverageDelay();

  averageFlightDistance = q.averageFlightDistance();
  screenArray = new Screen [NUMBER_OF_SCREENS];

  image= loadImage("AirTrackr2.png");
  createDropdownArray();
  createFirstScreen();

  profile = new AirlinerProfile("AA");
}

void draw() {
  background(255);
// heatmap.drawAirports(); // uncomment to draw heatmap

  createScreens(currentScreenShown);

  screenArray[currentScreenShown].draw();
  if (profile.show) {
    profile.draw();
    profile.mouseDragged();
  }
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

void keyPressed() {
  switch (key) {
  case 'q':
    profile = new AirlinerProfile("AA");
    profile.show = true;

    break;
  case 'w':
    profile = new AirlinerProfile("AS");
    profile.show = true;

    break;
  case 'e':
    profile = new AirlinerProfile("B6");
    profile.show = true;

    break;
  case 'r':
    profile = new AirlinerProfile("DL");
    profile.show = true;

    break;
  case 't':
    profile = new AirlinerProfile("F9");
    profile.show = true;

    break;
  case 'y':
    profile = new AirlinerProfile("G4");
    profile.show = true;

    break;
  case 'u':
    profile = new AirlinerProfile("HA");
    profile.show = true;
    break;
  case 'i':
    profile = new AirlinerProfile("NK");
    profile.show = true;
    break;
  case 'o':
    profile = new AirlinerProfile("UA");
    profile.show = true;
    break;
  case 'p':
    profile = new AirlinerProfile("WN");
    profile.show = true;
    break;
  default:
    profile.show = false;
    break;
  }
}
