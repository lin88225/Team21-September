// Global variables
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
  
  // Load the dataset
  flightsData = loadTable("flights100k.csv", "header");

  // Extract unique cities for origin and destination dropdowns using the correct column names
  String[] originCities = getUniqueCities("ORIGIN_CITY_NAME");
  String[] destinationCities = getUniqueCities("DEST_CITY_NAME");
  
  // Fonts and colors setup
  PFont dropdownFont = createFont("Arial", 16);
  int titleColour = color(0, 0, 0);
  int menuColour = color(200, 200, 200);
  int clickColour = color(100, 100, 100);
  boolean multipleSelection = false;

  // Initialize dropdowns for origin and destination cities
  originDrop = new Dropdown(25, 450, 200, 30, "Select Origin City", originCities, titleColour, menuColour, clickColour, dropdownFont, multipleSelection);
  destinationDrop = new Dropdown(275, 450, 200, 30, "Select Destination City", destinationCities, titleColour, menuColour, clickColour, dropdownFont, multipleSelection);
  
  // Placeholder: You need to implement makeWidgets() or an equivalent setup method in your Dropdown class.
  // originDrop.makeWidgets();
  // destinationDrop.makeWidgets();

  // Initialize the "Check Flight" button
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
  // Check if the "Check Flight" button is clicked
  if (checkFlightButton.isClicked(mouseX, mouseY)) 
  {
    handleCheckFlightButtonClick();
  }
}

// This method should be part of your Button class
boolean isClicked(int mouseX, int mouseY) 
{
  return mouseX >= x && mouseX <= x + width && mouseY >= y && mouseY <= y + height;
}

// Extract unique city names from a specified column in the dataset
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

// Check if there's a direct flight between the specified origin and destination cities
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

// Placeholder for handling the button click logic
void handleCheckFlightButtonClick() 
{
  // You need to implement logic to get the selected city from each Dropdown
  String origin = originDrop.getSelectedCity(); // Implement this method in Dropdown class
  String destination = destinationDrop.getSelectedCity(); // Implement this method in Dropdown class
  
  if (flightExists(origin, destination)) 
  {
    Point originCoord = getCityCoordinates(origin); // Implement this
    Point destinationCoord = getCityCoordinates(destination); // Implement this
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
  
  // Method to check if the button is clicked, placed inside the Button class
  boolean isClicked(int mouseX, int mouseY) 
  {
    return mouseX >= x && mouseX <= x + width &&  mouseY >= y && mouseY <= y + height;
  }
}
