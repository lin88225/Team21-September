class Arrow {
  //Arrow class is like the button class but with images that will represent that button 
  // if it is pressen or not 
  // K.N.
  
  float xpos;
  float ypos;
  PImage img1, img2;

  Arrow(float xpos, float ypos, PImage img1, PImage img2) {
    numberOfButtons += 1;
    this.xpos = xpos;
    this.ypos = ypos;
    this.img1=img1;
    this.img2=img2;
  }

  public void draw() {
    if (isMouseOver())
      image(img2, xpos, ypos);
    else
      image(img1, xpos, ypos);
  }

  public boolean isMouseOver() {
    if (xpos< mouseX && xpos+img1.width > mouseX && ypos+10 < mouseY && ypos+img1.height-12 > mouseY) {
      return true;
    }
    return false;
  }
}
