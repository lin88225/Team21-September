/**
 Class written by Michael Moore that creates and draws screens and deals with the objects declared in it.
 
 Updated Screen class: displayed the two buttons Next and Back using images,
 added image edited on Canva as background of our start page (screen(0)),
 added playButton for start page so you can enter the app,
 added a menu screen, with its corresponding edited image, that will appear once you press the menu button
 (this screen allows you to navigate through the screens without the arrows)
 and the relative menu buttons and modified some methods.
 Katia Neli
 */

int numberOfScreens = NUMBER_OF_SCREENS;
int currentNumberOfScreens = 0;
int currentScreenShown = 0;

class Screen {

  ArrayList<PieChart> pieCharts = new ArrayList<>();
  ArrayList<BarChart> barCharts = new ArrayList<>();
  ArrayList<Map> maps = new ArrayList<>();
  Dropdown[] dropdowns;
  TextWidget[] textWidgets;
  ArrayList<Button> buttons = new ArrayList<>();
  color backgroundColor = MIMI_PINK;
  int screenID;
  Button nextScreen;
  Button previousScreen;
  Button playButton;
  Button menuButton;
  Button [] arrayMenuButtons;
  //images of all the buttons and backgrounds
  PImage arrowNextImage, arrowNextImageWhiteBorder,
    arrowBackImage, arrowBackImageWhiteBorder,
    imgFirstPage,
    imgPlayButton, imgPlayButtonWhiteBorder,
    imgMenuButton, imgMenuButtonWhiteBorder, imgMenuBackground,
    buttonHome, buttonHomeYellow,
    buttonFlightsSCA, buttonFlightsSCAYellow,
    buttonDelay, buttonDelayYellow,
    buttonCancDivSCA, buttonCancDivSCAYellow,
    buttonDistance, buttonDistanceYellow,
    buttonFlightsPerDate, buttonFlightsPerDateYellow,
    buttonMapUSA, buttonMapUSAYellow;

  Screen(int screenID) {
    this.screenID = screenID;
    screenID = currentNumberOfScreens;
    numberOfScreens += 1;
    arrowNextImage=loadImage("blueArrowNextDarker.png");
    arrowNextImageWhiteBorder=loadImage("blueArrowNextDarker2.png");
    arrowBackImage=loadImage("blueArrowBackDarker.png");
    arrowBackImageWhiteBorder=loadImage("blueArrowBackDarker2.png");
    imgFirstPage=loadImage("AirtrackrFirstPage.png");//added image first screen
    imgPlayButton=loadImage("startButton1.png");
    imgPlayButtonWhiteBorder=loadImage("startButton2.png");
    imgMenuButton=loadImage("menuButton.png");
    imgMenuButtonWhiteBorder=loadImage("menuButton2.png");
    imgMenuBackground=loadImage("AirtrackrMenu2.png");
    //loads images for menuButtons
    buttonHome=loadImage("home.png");
    buttonHomeYellow=loadImage("home2.png");
    buttonFlightsSCA=loadImage("flightsSCA.png");
    buttonFlightsSCAYellow=loadImage("flightsSCA2.png");
    buttonDelay=loadImage("delayAirline.png");
    buttonDelayYellow=loadImage("delayAirline2.png");
    buttonCancDivSCA=loadImage("cancDivSCA.png");
    buttonCancDivSCAYellow=loadImage("cancDivSCA2.png");
    buttonDistance=loadImage("distanceAirline.png");
    buttonDistanceYellow=loadImage("distanceAirline2.png");
    buttonFlightsPerDate=loadImage("flightsDate.png");
    buttonFlightsPerDateYellow=loadImage("flightsDate2.png");
    buttonMapUSA=loadImage("map.png");
    buttonMapUSAYellow=loadImage("map2.png");

    nextScreen = new Button(SCREENX - 100, SCREENY-80, arrowNextImage, arrowNextImageWhiteBorder);
    previousScreen = new Button(100-arrowBackImage.width, SCREENY-80, arrowBackImage, arrowBackImageWhiteBorder);
    playButton = new Button(SCREENX/2-imgPlayButton.width/2, SCREENY/2-imgPlayButton.height/2, imgPlayButton, imgPlayButtonWhiteBorder);
    menuButton= new Button(10, 42, imgMenuButton, imgMenuButtonWhiteBorder);
    dropdowns = new Dropdown[] {};
    textWidgets = new TextWidget[]{};
    arrayMenuButtons= new Button[7];
    initialiseArrayMenuButtons(arrayMenuButtons);
  }

  Screen(int screenID, Dropdown[] dropdowns) {
    this(screenID);
    this.dropdowns = dropdowns;
  }

  //added a constructor that allows a Screen to have TextWidgets - Katia Neli
  Screen(int screenID, Dropdown[] dropdowns, TextWidget textWidgets[]) {
    this(screenID);
    this.dropdowns = dropdowns;
    this.textWidgets = textWidgets;
  }

  void initialiseArrayMenuButtons(Button [] array) {
    array[0]= new Button (SCREENX/3+17, SCREENY/3, buttonHome, buttonHomeYellow);
    array[1]= new Button (SCREENX/2+33, SCREENY/3, buttonFlightsSCA, buttonFlightsSCAYellow);
    array[2]= new Button (SCREENX/3-10, SCREENY/3+80, buttonDelay, buttonDelayYellow);
    array[3]= new Button (SCREENX/2+30, SCREENY/3+65, buttonCancDivSCA, buttonCancDivSCAYellow);
    array[4]= new Button (SCREENX/3, SCREENY/3+150, buttonDistance, buttonDistanceYellow);
    array[5]= new Button (SCREENX/2+62, SCREENY/3+1+150, buttonFlightsPerDate, buttonFlightsPerDateYellow);
    array[6]= new Button (SCREENX/3+10, SCREENY/3+220, buttonMapUSA, buttonMapUSAYellow);
  }


  public void draw() {
    background(backgroundColor);
    Button button;
    PieChart pieChart;
    BarChart barChart;
    Map map;
    for (int i = 0; i < buttons.size(); i++)
    {
      button = buttons.get(i);
      button.draw();
    }
    for (int i = 0; i < maps.size(); i++)
    {
      map = maps.get(i);
      map.draw();
    }
    for (int i = 0; i < dropdowns.length; i++)
    {
      dropdowns[i].draw();
    }
    for (int i = 0; i < textWidgets.length; i++)
    {
      textWidgets[i].draw();
    }
    for (int i = 0; i < pieCharts.size(); i++)
    {
      pieChart = pieCharts.get(i);
      pieChart.draw();
    }
    for (int i = 0; i < barCharts.size(); i++)
    {
      barChart = barCharts.get(i);
      barChart.draw();
    }

    if (screenID == 0) {
      image(imgFirstPage, 0, 0);
      playButton.draw();
    }

    if (screenID == 6) {
      text("Insert date range\n(MM/DD/YYYY):", 100, SCREENY/2-2*DROPDOWN_HEIGHT-10);
    }

    if (screenID == NUMBER_OF_SCREENS - 1) {
      image(imgMenuBackground, -15, 85);
      for (int i=0; i < arrayMenuButtons.length; i++) {
        arrayMenuButtons[i].draw();
      }
      line(SCREENX/2-2, 200, SCREENX/2-2, SCREENY-140);
      stroke(WHITE);
      strokeWeight(0.5);
    }

    if (screenID!=0) {
      image(image, 0, 0);
      menuButton.draw();
    }
    if (screenID != 0 && screenID !=1 && screenID != NUMBER_OF_SCREENS - 1) {
      previousScreen.draw();
    }
    if (screenID != NUMBER_OF_SCREENS - 2 && screenID != NUMBER_OF_SCREENS - 1 && screenID !=0 ) {
      nextScreen.draw();
    }
  }

  public int checkButtonsPressed() {
    if (nextScreen.isMouseOver()) {
      if (currentScreenShown != NUMBER_OF_SCREENS - 2 && currentScreenShown != NUMBER_OF_SCREENS - 1  && currentScreenShown!=0) {
        currentScreenShown += 1;
      }
    }
    if (previousScreen.isMouseOver()) {
      if (currentScreenShown !=0 && currentScreenShown!=1 && currentScreenShown != NUMBER_OF_SCREENS - 1) {
        currentScreenShown -= 1;
      }
    }
    if (playButton.isMouseOver()) {
      if (currentScreenShown == 0) {
        currentScreenShown = 1;
      }
    }

    if (menuButton.isMouseOver()) {
      currentScreenShown = NUMBER_OF_SCREENS - 1;
    }

    for (int i=0; i < arrayMenuButtons.length; i++) {
      if (currentScreenShown == NUMBER_OF_SCREENS - 1) {
        if ( arrayMenuButtons[i].isMouseOver())
          currentScreenShown=i+1;
      }
    }
    return NO_BUTTON_PRESSED;
  }

  public void addPieChart(int [] values, int diameter, int x, int y, String [] description, String title) {
    PieChart pieChart = new PieChart(values, diameter, x, y, description, title);
    pieCharts.add(pieChart);
  }

  public void removePieChart(int index) {
    pieCharts.remove(index);
  }
  public PieChart getPieChart(int index) {
    return pieCharts.remove(index);
  }

  public void addBarChart(float [] xData, String [] yData, int x, int y, String title, String descriptionOfX, String descriptionOfY) {
    BarChart barcharts = new BarChart(xData, yData, x, y, title, descriptionOfX, descriptionOfY);
    barCharts.add(barcharts);
  }
  public void removeBarChart(int index) {
    barCharts.remove(index);
  }
  public BarChart getBarChart(int index) {

    return barCharts.get(index);
  }

  public void addButton(float xpos, float ypos, float height, float width, String text) {
    Button button = new Button( xpos, ypos, height, width, text);
    buttons.add(button);
  }
  public void removeButton(int index) {
    buttons.remove(index);
  }
  public Button getButton(int index) {

    return buttons.get(index);
  }

  public void addMap(float xpos, float ypos) {
    Map map = new Map(xpos, ypos);
    maps.add(map);
  }
  public void removeMap(int index) {
    maps.remove(index);
  }
  public Map getMap(int index) {
    return maps.get(index);
  }
}
