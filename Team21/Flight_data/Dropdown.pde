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
    titleWidget.draw();
    makeWidgets();
    hoverTitle = titleWidget.getEvent(pmouseX, pmouseY);
    if (mousePressed)
    {
      if (clickDelay == 0)
      {
        clickTitle += titleWidget.getEvent(pmouseX, pmouseY);
        if (clickTitle%2==0)
        {
          for (int i =0; i<menuWidgets.length; i++)
          {
            clickMenu[i] += menuWidgets[i].getEvent(pmouseX, pmouseY);
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
      menuWidgets[i] = new Widget(x, y+height+i*height, width, height, dropdownDisplay[i], menuColour, clickColour, dropdownFont, 1);
    }
  }
  void selectMenu()
  {
    if (clickTitle % 2 == 0)
    {
      for (int i = 0; i < menuWidgets.length; i++)
      {
        selectOption();
        menuWidgets[i].draw();
        hoverMenu = menuWidgets[i].getEvent(pmouseX, pmouseY);
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
        for(int j = 0; j<menuWidgets.length; j++)
        {
          if(!multipleSelection && j != i && clickMenu[j]%2==0)
          {
            menuWidgets[j].mainColour = menuWidgets[j].widgetColour;
            clickMenu[j] += menuWidgets[i].getEvent(pmouseX, pmouseY);
          }
        }
      } 
      else if (clickMenu[i]%2!=0)
      {
        menuWidgets[i].mainColour = menuWidgets[i].widgetColour;
      }
    }
  }
}
