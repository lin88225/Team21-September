/* A class that draws a dropdown menu and stores if inidividual values have been clicked or not
The array clickTitle stores whether each value in the array has been clicked or not, the options in the menu also change colour to indicate to the user that the box has been clicked
There is a 15 frame delay implemented in between clicks in order to stop bugs when the mouse is held down
Cara Saulnier
*/

class Dropdown
{
  int x, y, width, height;
  String dropdownTitle;
  String [] dropdownDisplay;
  color titleColour, menuColour, clickColour;
  PFont dropdownFont;
  Widget titleWidget;
  Widget [] menuWidgets;
  int hoverTitle = 0;
  int hoverMenu = 0;
  int clickTitle = 1;
  int clickMenu[];
  int clickDelay = 0;
  int scrollIndex = 0; // This index tells the programme how far down the user has scrolled
  int numOfDropsToDisplay = 5;
  boolean multipleSelection;

  Dropdown(int x, int y, int width, int height, String dropdownTitle, String [] dropdownDisplay, color titleColour, color menuColour, color clickColour, PFont dropdownFont, boolean multipleSelection)
  {
    this.x = x;
    this.y = y;
    this.height = height;
    this.width = width;
    this.dropdownTitle = dropdownTitle;
    this.dropdownDisplay = dropdownDisplay;
    this.titleColour = titleColour;
    this.menuColour = menuColour;
    this.clickColour = clickColour;
    this.dropdownFont = dropdownFont;
    this.menuWidgets = new Widget [dropdownDisplay.length];
    this.clickMenu = new int [dropdownDisplay.length];
    for (int i =0; i<dropdownDisplay.length; i++)
    {
      clickMenu[i] = 1;
    }
    this.multipleSelection = multipleSelection;
  }
  void draw()
  {
    makeWidgets();
    titleWidget.draw();
    hoverTitle = titleWidget.getEvent(pmouseX, pmouseY);
    if (mousePressed)
    {
      if (clickDelay == 0)
      {
        clickTitle += titleWidget.getEvent(pmouseX, pmouseY);
        if (clickTitle%2==0)
        {
          for (int i =0; i<numOfDropsToDisplay; i++)
          {
            clickMenu[i+scrollIndex] += menuWidgets[i].getEvent(pmouseX, pmouseY);
          }
        }
        clickDelay++;
      }
    }
    if (clickDelay !=0)
    {
      clickDelay++;
      if (clickDelay == FRAMES_PER_CLICK)
      {
        clickDelay = 0;
      }
    }
    selectMenu();
  }
  void makeWidgets()
  {
    titleWidget = new Widget(x, y, width, height, dropdownTitle, titleColour, clickColour, dropdownFont, 1);
    for (int i = 0; i < dropdownDisplay.length; i++)
    {
      menuWidgets[i] = new Widget(x, y+3*height/4+i*height/2, width, height/2, dropdownDisplay[i], menuColour, clickColour, dropdownFont, 1);
      if (menuWidgets[i].y + menuWidgets[i].height/2 > SCREENY && i<= numOfDropsToDisplay)
      {
        for (int j = 0; j<=i; j++)
        {
          menuWidgets[j].y -= menuWidgets[j].y-SCREENY+menuWidgets[j].height*j+menuWidgets[j].height;
          menuWidgets[j].x = SCREENX/2;
        }
      }
    }
  }
  void selectMenu()
  {
    if (clickTitle % 2 == 0)
    {
      for (int i = 0; i < numOfDropsToDisplay; i++)
      {
        selectOption();
        if (scrollIndex!=0)
        {
          menuWidgets[i+scrollIndex].y -= (scrollIndex)*height/2;
        }
        menuWidgets[i+scrollIndex].draw();
        hoverMenu = menuWidgets[i+scrollIndex].getEvent(pmouseX, pmouseY);
      }
    }
  }
  void selectOption()
  {
    for (int i =0; i< menuWidgets.length; i++)
    {
      if (clickMenu[i]%2==0)
      {
        menuWidgets[i].mainColour = menuWidgets[i].clickedColour;
        for (int j = 0; j<menuWidgets.length; j++)
        {
          if (!multipleSelection && j != i && clickMenu[j]%2==0)
          {
            menuWidgets[j].mainColour = menuWidgets[j].widgetColour;
            clickMenu[j] += menuWidgets[i].getEvent(pmouseX, pmouseY);
          }
        }
      } else if (clickMenu[i]%2!=0)
      {
        menuWidgets[i].mainColour = menuWidgets[i].widgetColour;
      }
    }
  }
  void scroll(int i) {
    scrollIndex += i;
    if (scrollIndex < 0) {
      scrollIndex = 0 ;
    }
    if (scrollIndex > - numOfDropsToDisplay + dropdownDisplay.length)
    {
      scrollIndex = dropdownDisplay.length - numOfDropsToDisplay;
    }
  }
}
