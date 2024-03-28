int x = 100;
int y = 100;
PImage bg;
Dropdown originDrop, destinationDrop;
Button checkFlightButton;
Table flightsData;
import java.util.HashSet;

void setup() 
{
  //size(550, 500);
  background(255);
  bg = loadImage("usa-map.jpg");
  

  flightsData = loadTable("flights100k.csv", "header");


  String[] originCities = getUniqueCities("ORIGIN_CITY_NAME");
  String[] destinationCities = getUniqueCities("DEST_CITY_NAME");
  

  PFont dropdownFont = createFont("Arial", 16);
  int titleColour = color(0, 0, 0);
  int menuColour = color(200, 200, 200);
  int clickColour = color(100, 100, 100);
  boolean multipleSelection = false;

 
  originDrop = new Dropdown(25, 450, 200, 30, "Select Origin City", originCities, titleColour, menuColour, clickColour, dropdownFont, multipleSelection);
  destinationDrop = new Dropdown(275, 450, 200, 30, "Select Destination City", destinationCities, titleColour, menuColour, clickColour, dropdownFont, multipleSelection);



  checkFlightButton = new Button(450, 450, 80, 30, "Check Flight");
}

void draw() 
{
  image(bg, 0, 0, 550, 500);
  originDrop.draw();
  destinationDrop.draw();
  checkFlightButton.draw();
}

void mousePressed() 
{

  if (checkFlightButton.isClicked(mouseX, mouseY)) 
  {
    handleCheckFlightButtonClick();
  }
}


boolean isClicked(int mouseX, int mouseY) 
{
  return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
}


String[] getUniqueCities(String columnName) 
{
  HashSet<String> cities = new HashSet<String>();
  for (TableRow row : flightsData.rows()) 
  {
    String city = row.getString(columnName);
    cities.add(city);
  }
  return cities.toArray(new String[cities.size()]); // Convert HashSet to Array
}


boolean flightExists(String originCity, String destinationCity) 
{
  for (TableRow row : flightsData.rows()) 
  {
    if (row.getString("ORIGIN_CITY_NAME").equals(originCity) && row.getString("DEST_CITY_NAME").equals(destinationCity)) 
    {
      return true; // A matching flight was found
    }
  }
  return false; // No matching flight found
}


void handleCheckFlightButtonClick() 
{
 
  String origin = originDrop.getSelectedCity(); 
  String destination = destinationDrop.getSelectedCity(); 
  
  if (flightExists(origin, destination)) 
  {
    Point originCoord = getCityCoordinates(origin); 
    Point destinationCoord = getCityCoordinates(destination); 
    stroke(255, 0, 0);
    line(originCoord.x, originCoord.y, destinationCoord.x, destinationCoord.y);
  } 
  else 
  {
    println("No direct flight found between " + origin + " and " + destination);
  }
}

class Button 
{
  int x, y, width, height;
  String label;
  
  Button(int x, int y, int width, int height, String label) 
  {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
  }
  
  void draw() 
  {
    fill(200);
    rect(x, y, width, height);
    fill(0);
    textAlign(CENTER, CENTER);
    text(label, x + width / 2, y + height / 2);
  }
  
 
  boolean isClicked(int mouseX, int mouseY) 
  {
    return mouseX >= x && mouseX <= x + width &&  mouseY >= y && mouseY <= y + height;
  }
}
