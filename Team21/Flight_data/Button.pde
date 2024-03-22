class Button{
  float xpos; float ypos;
  float height; float width;
  color colorOfButton;
  String text;
  PFont arial;
  
  
  Button(float xpos, float ypos, float height, float width, String text){
    this.xpos = xpos;
    this.ypos = ypos;
    this.height = height;
    this.width = width;
    arial = loadFont("Arial-BoldMT-14.vlw");
    this.text = text;
    colorOfButton = GREY;
  }
  
  Button(float xpos, float ypos, float height, float width, String text, color colorOfButton){
    this(xpos, ypos, height, width, text);
    this.colorOfButton = colorOfButton;
  }
  
  public void draw(){
    fill(colorOfButton);
    if(isMouseOver())
    {
      stroke(WHITE);
    }else
    {
      stroke(BLACK);
    }
    rect(xpos, ypos, width, height);
    fill(0);
    drawText();
  }
  
  public boolean isMouseOver(){
    float bottomYOfButton = ypos + height;
    float rightXOfButton = xpos + width;
    if(xpos < mouseX && rightXOfButton > mouseX && ypos < mouseY && bottomYOfButton > mouseY){
      return true;
    }
    return false;
  }
  
  public void drawText(){
    textFont(arial);
    int textSize = (int) height / 3;
    textSize(textSize);
    text(text, xpos + ((width / 2) - text.length() * height/12), ypos + (height * 3/5));
  }
}