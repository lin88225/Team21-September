
/*
-L.Mc
 This class stores the Airliner Profile for each of the Airlines
 These are read from a their respective files (To be added)
 This also can create a pop-up page for the profile
 */
public class AirlinerProfile {
  public PImage logo, planePicture;
  public float emissionPerDistanceUnit, ratio = 0.2;
  public int lastCrashDate, totalNumberOfCrashes, disX, disY, posX = SCREENX/2, posY = SCREENY/2;
  public String name, description, foodMenu, lastUpdated;
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

    foodMenu = desc[1];
    lastCrashDate = Integer.parseInt(desc[2]);
    totalNumberOfCrashes = Integer.parseInt(desc[3]);
    emissionPerDistanceUnit = Float.parseFloat(desc[4]);
    lastUpdated = desc[5];
    description = desc[6] + "\n" + desc[7] ;
  }


  /*
  L.Mc
   
   This creates a draggable profile-page for the profile
   */
  float spaceIncrement = PROFILE_SIZE/25;
  PFont sans = createFont("Comic Sans MS", spaceIncrement);
  /*
  public void updateProfileValues() {
   
   logo = loadImage(logoFName);
   planePicture = loadImage(planeFName);
   spaceIncrement = PROFILE_SIZE/25;
   sans = createFont("Comic Sans MS", spaceIncrement);
   logo.resize(resizeTo, resizeTo);
   planePicture.resize(2*resizeTo, resizeTo);
   resizeTo = (int)(ratio*PROFILE_SIZE);
   
   }
   */

  public void draw () {

    this.mouseDragged();
    stroke (255);
    fill (255);
    rect (posX, posY, PROFILE_SIZE, PROFILE_SIZE, 20);
    image(logo, posX, posY);
    image(planePicture, posX+resizeTo, posY);
    fill (0);
    textAlign(LEFT, TOP);
    textFont(sans);
    float textYPos = posY + resizeTo;
    text("Name:" + name, posX, textYPos + spaceIncrement);

    text("Date of last plane crash:" + lastCrashDate, posX, textYPos + spaceIncrement*3);
    text("Number of planes crashed:" + totalNumberOfCrashes, posX, textYPos + spaceIncrement*4);

    text("Emmissions per distance unit:" + emissionPerDistanceUnit, posX, textYPos + spaceIncrement*5);
    text("In-Flight menu:" + foodMenu, posX, textYPos + spaceIncrement*7);


    text(description, posX, textYPos + spaceIncrement*10);
    textAlign(RIGHT, BOTTOM);
    text("Last updated:" + lastUpdated, posX + PROFILE_SIZE, posY + PROFILE_SIZE);

    stroke (0);
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

float getGGHE(String airliner, int distance) {
  float result = 0;
//Get accurate info for each airliner, just brute force it


  switch(airliner) {
  case "AA":
    //For each airliner, invoke it's unique variables,
    // Average seat count, abc variables, Cargo factor,

    break;
  case "AS":
    break;
  case "B6":
    break;
  case "DL":
    break;
  case "F9":
    break;
  case "G4":
    break;
  case "HA":
    break;
  case "NK":
    break;
  case "UA":
    break;
  case "WN":
    break;
  default:
  }
  return result;
}
