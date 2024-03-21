PFont arial;
void settings()
{
  size(SCREENX, SCREENY);
}
void setup()
{
  arial = loadFont("Arial-BoldMT-14.vlw");
  textFont(arial);
  textAlign(CENTER, CENTER);
  fill(color(0));
  
}
void draw()
{
  background(255);
  String [] flightInfo = readData();
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
