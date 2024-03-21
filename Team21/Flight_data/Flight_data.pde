boolean printed;
int showCounter;
PFont arial;
int i;
void settings()
{
  size(SCREENX, SCREENY);
}
void setup()
{
  printed = false;
  showCounter = 0;
  arial = loadFont("Arial-BoldMT-14.vlw");
  textFont(arial);
  textAlign(CENTER, CENTER);
  fill(color(0));
  i=0;
}
void draw()
{
  background(255);
  String [] flightInfo = readData();
  text(flightInfo[i], SCREENX/2, SCREENY/2);
  showCounter++;
  if (showCounter>=20)
  {
    showCounter =0;
    i++;
  }
}
String[] readData()
{
  String [] flightData = loadStrings("flights100k.csv");
  if (!printed)
  {
    for (int i =0; i<flightData.length; i++)
    {
      System.out.println(flightData[i]);
    }
    printed = true;
  }

// Parameters: Arraylist of datapoints, the variable you you like to sort for as a String
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
  return flightData;
}
