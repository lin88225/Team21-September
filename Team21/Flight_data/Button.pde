private static int numberOfButtons = 0;
/**
 Class made by Michael Moore that is supposed to create and draw buttons
 and to determine whether the mouse is over a button or not.
 Updated the class with a new constructor that allows the creation of buttons
 with images. The draw and isMouseOver functions have been modified according to that.
 Katia Neli
 */
class Button {
  float xpos;
  float ypos;
  float height;
  float width;
  color colorOfButton;
  String text;
  PFont arial;
  int buttonID;
  PImage normalButtonImage, bordersButtonImage;
  boolean buttonUsingImage=false;

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

  //constructor that creates a button using images
  Button(float xpos, float ypos, PImage normalButtonImage, PImage bordersButtonImage) {
    numberOfButtons += 1;
    this.xpos = xpos;
    this.ypos = ypos;
    this.normalButtonImage=normalButtonImage;
    this.bordersButtonImage=bordersButtonImage;
    buttonUsingImage=true;//determines whether the button was created using this constructor/with images or not
  }

  void draw() {
    if (!buttonUsingImage) {
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
    } else {
      //if the button was created using images it will draw the second image when the mouse is over
      if (isMouseOver())
        image(bordersButtonImage, xpos, ypos);
      else
        image(normalButtonImage, xpos, ypos);
    }
  }

  boolean isMouseOver() {
    if (!buttonUsingImage) {
      float bottomYOfButton = ypos + height/2;
      float rightXOfButton = xpos + width/2;
      float leftXOfButton = xpos - width/2;
      float topYOfButton = ypos - height/2;
      if (leftXOfButton < mouseX && rightXOfButton > mouseX && topYOfButton < mouseY && bottomYOfButton > mouseY) {
        return true;
      }
      return false;
    } else {
      //if the button was created using images it will determine if the mouse is over it based on the dimension and position of the image
      if (xpos< mouseX && xpos+normalButtonImage.width > mouseX && ypos+10 < mouseY && ypos+normalButtonImage.height-12 > mouseY) {
        return true;
      }
      return false;
    }
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
