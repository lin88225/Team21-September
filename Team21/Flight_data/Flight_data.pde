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
  return flightData;
}
