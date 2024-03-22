
/*
-L.Mc
 This class stores the Airliner Profile for each of the Airlines
 These are read from a their respective files (To be added)
 This also can create a pop-up page for the profile
 */
public class AirlinerProfile {
  public PImage logo, planePicture;
  public float emissionPerDistanceUnit;
  public int lastCrashDate, totalNumberOfCrashes;
  public String name, description, foodMenu, lastUpdated;


  AirlinerProfile(String logoFName, String planeFName, String mainFName) {
    logo = loadImage(logoFName);
    planePicture = loadImage(planeFName);
    String[] desc = loadStrings(mainFName);
    name = desc[0];
    description = desc[1];
    foodMenu = desc[2];
    lastCrashDate = Integer.parseInt(desc[3]);
    totalNumberOfCrashes = Integer.parseInt(desc[4]);
    emissionPerDistanceUnit = Float.parseFloat(desc[5]);
    lastUpdated = desc[6];
    //Convert the rest
  }

  /*
  L.Mc
   
   This creates a mini-draggable profile-page for the profile
   */
  public void display () {
    image(logo, 50, 50);
    image(planePicture, 100, 100);
    text(description, 30, 30);
  }
}
