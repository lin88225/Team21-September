boolean printed;
void setup()
{
  printed = false;
}
void draw()
{
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
  return flightData;
}