/* Code to draw widgets to a screen
These widgets are used when implementing the dropdown menu
Cara Saulnier
*/
class Widget {
  int x, y, width, height;
  String label;
  int event;
  color mainColour, widgetColour, labelColour, clickedColour;
  PFont widgetFont;
  color lineColour;

  Widget(int x, int y, int width, int height, String label, color widgetColour, color clickedColour, PFont widgetFont, int event)
  {
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.mainColour = widgetColour;
    this.widgetColour=widgetColour;
    this.widgetFont=widgetFont;
    this.clickedColour=clickedColour;
    labelColour= WHITE;
    lineColour = color(0);
  }
  
  void draw()
  {
    fill(mainColour);
    hover(mouseX, mouseY);
    rect(x, y, width, height, 10);
    fill(labelColour);
    textFont(widgetFont);
    text(label, x, y);
  }
  
  int getEvent(int mX, int mY)
  {
    if (mX >= x-width/2 && mX <= x+width/2 && mY >= y-height/2 && mY <= y+height/2)
    {
      return event;
    }
    return EVENT_NULL;
  }
  void hover(int mX, int mY)
  {
    if (mX >= x-width/2 && mX <= x+width/2 && mY >= y-height/2 && mY <= y+height/2)
    {
      stroke(MIMI_PINK);
    } else
    {
      stroke(BLACK);
    }
  }
}
