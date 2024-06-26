/**
-L.Mc
 This class stores the Airliner Profile for each of the Airlines
 These are read from a their respective files
 This also can create a pop-up page for the profile
 */
public class AirlinerProfile {
  color darker = color(0, 100, 100, 100);
  public boolean show = false;
  public PImage logo, planePicture;
  public float ratio = 0.2;
  public int totalNumberOfCrashes, disX, disY;
  public int posX = SCREENX/2, posY = SCREENY/2;
  public String name, description, lastUpdated, lastCrashDate;
  public String logoFName, planeFName, mainFName;
  int resizeTo = (int)(ratio*PROFILE_SIZE);
  AirlinerProfile() {
  }

  public AirlinerProfile(String abrieviation) {
    this.logoFName = ("Logo" + abrieviation + ".png");
    this.planeFName = ("Plane" + abrieviation + ".png");
    this.mainFName = (abrieviation + ".txt");

    logo = loadImage(this.logoFName);
    planePicture = loadImage(this.planeFName);

    logo.resize(resizeTo, resizeTo);
    planePicture.resize(2*resizeTo, resizeTo);
    String[] desc = loadStrings(this.mainFName);
    name = desc[0];

    lastCrashDate = desc[2];
    totalNumberOfCrashes = Integer.parseInt(desc[3]);
    lastUpdated = desc[5];
    description = desc[6] + "\n" + desc[7] ;
  }


  /*
  L.Mc
   This creates a draggable profile-page for the profile
   */
  float spaceIncrement = PROFILE_SIZE/25;
  PFont sans = createFont("Gadugi Bold", spaceIncrement);

  public void draw () {


    rectMode(CORNER);
    this.mouseDragged();
    stroke (BLACK);
    fill (MIMI_PINK - darker);
    rect (posX, posY, PROFILE_SIZE, PROFILE_SIZE, 20);
    image(logo, posX + 20, posY+3);
    image(planePicture, posX+resizeTo + 20, posY+3);
    fill (WHITE);
    textAlign(LEFT, TOP);
    textFont(sans);
    float textYPos = posY + resizeTo;
    text("Name:" + name, posX, textYPos + spaceIncrement);

    text("Date of last plane crash:" + lastCrashDate, posX, textYPos + spaceIncrement*3);
    text("Number of planes crashed:" + totalNumberOfCrashes, posX, textYPos + spaceIncrement*4);



    text(description, posX, textYPos + spaceIncrement*10);
    textAlign(RIGHT, BOTTOM);
    text("Last updated:" + lastUpdated, posX + PROFILE_SIZE - 10, posY + PROFILE_SIZE);

    stroke (0);
    rectMode(CENTER);
    textFont(arial);
    fill (255);
  }

  boolean beingDragged = false;
  void mouseDragged() {
    boolean withinX = (mouseX >= posX && mouseX <= posX + PROFILE_SIZE);
    boolean withinY = (mouseY >= posY && mouseY <= posY + PROFILE_SIZE);
    boolean within = withinX && withinY;
    //If the mouse is within the bounds of the box
    if (within && mousePressed) {
      beingDragged = true;
    } else if (!mousePressed) {
      beingDragged = false;
    }

    if (beingDragged) {
      this.posX = this.disX + mouseX;
      this.posY = this.disY + mouseY;
    } else {
      this.disX = this.posX - mouseX;
      this.disY = this.posY - mouseY;
    }
  }
}
