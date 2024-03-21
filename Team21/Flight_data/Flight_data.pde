int showCounter;
PFont arial;
int i;
void settings()
{
  size(SCREENX, SCREENY);
}
void setup()
{
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
  return flightData;
}
