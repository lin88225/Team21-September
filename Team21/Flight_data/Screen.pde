private static int numberOfScreens = NUMBER_OF_SCREENS;
private static int currentNumberOfScreens = 0;
private static int currentScreenShown = 0;

class Screen {
  // I converted the 2 buttons Next and Back into Arrows
  // Added image I edited on Canva as background of our start page (screen(0))
  // Added playButton for start page so you can enter the app
  // Added a menu screen (last one) that will appear once you press on the menu button
  // This screen allows you to navigate through the screens without the arrows
  // K.N.

  ArrayList<PieChart> pieCharts = new ArrayList<>();
  ArrayList<BarChart> barCharts = new ArrayList<>();
  Dropdown[] dropdowns;
  TextWidget[] textWidgets;
  // ArrayList<Button> buttons = new ArrayList<>();
  color backgroundColor = MIMI_PINK;

  int screenID;

  //Button nextScreen;
  //Button previousScreen;
  //changed buttons to arrows
  Arrow nextScreen;
  Arrow previousScreen;
  Arrow playButton;
  Arrow menuButton;
  Arrow [] arrayMenuButtons;
  PImage image1, image2, image3, image4,
    imgFirstPage,
    imgPlayButton1, imgPlayButton2,
    imgMenu1, imgMenu2, imgMenu3,
    buttonScreen1, buttonScreen1Yellow,
    buttonScreen2, buttonScreen2Yellow,
    buttonScreen3, buttonScreen3Yellow,
    buttonScreen4, buttonScreen4Yellow,
    buttonScreen5, buttonScreen5Yellow,
    buttonScreen6, buttonScreen6Yellow,
    buttonScreen7, buttonScreen7Yellow,
    buttonScreen8, buttonScreen8Yellow;

  Screen(int screenID) {
    this.screenID = screenID;
    screenID = currentNumberOfScreens;
    numberOfScreens += 1;
    image1=loadImage("blueArrowNextDarker.png");
    image2=loadImage("blueArrowNextDarker2.png");
    image3=loadImage("blueArrowBackDarker.png");
    image4=loadImage("blueArrowBackDarker2.png");
    imgFirstPage=loadImage("AirtrackrFirstPage.png");//added image first screen
    imgPlayButton1=loadImage("startButton1.png");
    imgPlayButton2=loadImage("startButton2.png");
    imgMenu1=loadImage("menuButton.png");
    imgMenu2=loadImage("menuButton2.png");
    imgMenu3=loadImage("AirtrackrMenu2.png");
    //load images for menuButtons
    buttonScreen1=loadImage("home.png");
    buttonScreen1Yellow=loadImage("home2.png");
    buttonScreen2=loadImage("flightsSCA.png");
    buttonScreen2Yellow=loadImage("flightsSCA2.png");
    buttonScreen3=loadImage("delayAirline.png");
    buttonScreen3Yellow=loadImage("delayAirline2.png");
    buttonScreen4=loadImage("cancDivSCA.png");
    buttonScreen4Yellow=loadImage("cancDivSCA2.png");
    buttonScreen5=loadImage("distanceAirline.png");
    buttonScreen5Yellow=loadImage("distanceAirline2.png");
    buttonScreen6=loadImage("emissionsAirline.png");
    buttonScreen6Yellow=loadImage("emissionsAirline2.png");
    buttonScreen7=loadImage("flightsDate.png");
    buttonScreen7Yellow=loadImage("flightsDate2.png");
    buttonScreen8=loadImage("map.png");
    buttonScreen8Yellow=loadImage("map2.png");

    nextScreen = new Arrow(SCREENX - 100, SCREENY-80, image1, image2);
    previousScreen = new Arrow(100-image3.width, SCREENY-80, image3, image4);
    playButton = new Arrow(SCREENX/2-imgPlayButton1.width/2, SCREENY/2-imgPlayButton1.height/2, imgPlayButton1, imgPlayButton2);
    menuButton= new Arrow(10, 42, imgMenu1, imgMenu2);
    dropdowns = new Dropdown[] {};
    textWidgets = new TextWidget[]{};
    arrayMenuButtons= new Arrow[8];
    initialiseArrayMenuButtons(arrayMenuButtons);
  }

  Screen(int screenID, Dropdown[] dropdowns) {
    this(screenID);
    this.dropdowns = dropdowns;
  }

  Screen(int screenID, Dropdown[] dropdowns, TextWidget textWidgets[]) {//added a constructor that allows a Screen to have TextWidgets - K.N.
    this(screenID);
    this.dropdowns = dropdowns;
    this.textWidgets = textWidgets;
  }

  void initialiseArrayMenuButtons(Arrow [] array) {
    array[0]= new Arrow (SCREENX/3+17, SCREENY/3, buttonScreen1, buttonScreen1Yellow);
    array[1]= new Arrow (SCREENX/2+33, SCREENY/3, buttonScreen2, buttonScreen2Yellow);
    array[2]= new Arrow (SCREENX/3-10, SCREENY/3+80, buttonScreen3, buttonScreen3Yellow);
    array[3]= new Arrow (SCREENX/2+30, SCREENY/3+65, buttonScreen4, buttonScreen4Yellow);
    array[4]= new Arrow (SCREENX/3, SCREENY/3+150, buttonScreen5, buttonScreen5Yellow);
    array[5]= new Arrow (SCREENX/2+52, SCREENY/3+150, buttonScreen6, buttonScreen6Yellow);
    array[6]= new Arrow (SCREENX/3+10, SCREENY/3+220, buttonScreen7, buttonScreen7Yellow);
    array[7]= new Arrow (SCREENX/2+67, SCREENY/3+220, buttonScreen8, buttonScreen8Yellow);
  }


  public void draw() {
    background(backgroundColor);
    //Button button;
    PieChart pieChart;
    BarChart barChart;
    //for (int i = 0; i < buttons.size(); i++)
    //{
    // button = buttons.get(i);
    // button.draw();
    //}
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

    if (screenID == 7) {
      text("Insert date range\n(MM/DD/YYYY):", 100, SCREENY/2-2*DROPDOWN_HEIGHT-10);
    }

    if (screenID == NUMBER_OF_SCREENS - 1) {
      image(imgMenu3, -15, 85);
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
    if (screenID != 0 && screenID !=1 && screenID != NUMBER_OF_SCREENS - 1) { //modified condition
      previousScreen.draw();
    }
    if (screenID != NUMBER_OF_SCREENS - 2 && screenID != NUMBER_OF_SCREENS - 1 && screenID !=0 ) { //modified condition
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

    //for (int i = 0; i < buttons.size(); i++)
    //{
    //  if (buttons.get(i).isMouseOver())
    //  {
    //    return buttons.get(i).getID();
    //  }
    //}

    return NO_BUTTON_PRESSED;
  }

  //do we need the remove methods?
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
  /*
  public void addDropdown(int x, int y, int width, int height, String dropdownTitle, String [] dropdownDisplay, color titleColour, color menuColour, color clickColour, PFont dropdownFont, boolean multipleSelection){
   
   Dropdown dropdown = new Dropdown(x, y, width, height, dropdownTitle, dropdownDisplay, titleColour, menuColour, clickColour, dropdownFont, multipleSelection);
   dropdowns.add(dropdown);
   }
   public void removeDropdown(int index){
   dropdowns.remove(index);
   }
   public Dropdown getDropdown(int index){
   return dropdowns.get(index);
   }
   */

  // do we need these methods???
  /*public void addButton(float xpos, float ypos, float height, float width, String text) {
   Button button = new Button( xpos, ypos, height, width, text);
   buttons.add(button);
   }
   public void removeButton(int index) {
   buttons.remove(index);
   }
   public Button getButton(int index) {
   
   return buttons.get(index);
   }
   */
}
