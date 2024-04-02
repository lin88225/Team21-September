private static int numberOfButtons = 0;

class Button {
  float xpos;
  float ypos;
  float height;
  float width;
  color colorOfButton;
  String text;
  PFont arial;
  int buttonID;

  Button(float xpos, float ypos, float height, float width, String text) {
    buttonID = numberOfButtons;
    numberOfButtons += 1;
    this.xpos = xpos;
    this.ypos = ypos;
    this.height = height;
    this.width = width;
    arial = loadFont("Arial-BoldMT-14.vlw");
    this.text = text;
    colorOfButton = DENIM;
  }

  Button(float xpos, float ypos, float height, float width, String text, color colorOfButton) {
    this(xpos, ypos, height, width, text);
    this.colorOfButton = colorOfButton;
  }

  public void draw() {
    fill(colorOfButton);
    if (isMouseOver())
    {
      stroke(MIMI_PINK);
    } else
    {
      stroke(BLACK);
    }
    rect(xpos, ypos, width, height);
    fill(0);
    drawText();
  }

  public boolean isMouseOver() {
    float bottomYOfButton = ypos + height/2;
    float rightXOfButton = xpos + width/2;
    float leftXOfButton = xpos - width/2;
    float topYOfButton = ypos - height/2;
    if (leftXOfButton < mouseX && rightXOfButton > mouseX && topYOfButton < mouseY && bottomYOfButton > mouseY) {
      return true;
    }
    return false;
  }

  public void drawText() {
    textFont(arial);
    int textSize = (int) (height / 3);
    textSize(textSize);
    textAlign(CENTER, CENTER);
    fill(0);
    text(text, xpos, ypos);
  }

  public int getID() {
    return buttonID;
  }
}
