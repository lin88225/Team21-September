class TextWidget extends Widget {
 // This class allows to write some input on a Widget - K.N.
 
  int maxlen;
  
  TextWidget(int x, int y, int width, int height,
    String label, color widgetColour,color clickedColour, PFont font, int event, int maxlen) {
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
    this.maxlen=maxlen;
  }
  void append(char s) {
    if (s==BACKSPACE) {
      if (!label.equals(""))
        label=label.substring(0, label.length()-1);
    } else if (label.length() <maxlen)
      label=label+str(s);
  }
}
