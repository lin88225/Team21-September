/**
 This class allows to write some input on a Widget.
 Example: you write a date on the widget and its label will take that date as its value.
 Katia Neli
 */
class TextWidget extends Widget {

  int maxLenght;

  TextWidget(int x, int y, int width, int height,
    String label, color widgetColour, color clickedColour, PFont font, int event, int maxLenght) {
    super(x, y, width, height, label, widgetColour, clickedColour, font, event);
    this.x=x;
    this.y=y;
    this.width = width;
    this.height= height;
    this.label=label;
    this.event=event;
    this.widgetColour=widgetColour;
    this.widgetFont=font;
    labelColour=DENIM;
    this.maxLenght=maxLenght;
  }
  
  void append(char s) {
    if (s==BACKSPACE) {
      if (!label.equals(""))
        label=label.substring(0, label.length()-1);
    } else if (label.length() <maxLenght)
      label=label+str(s);
  }
}
