
/*
-L.Mc
This class stores the Airliner Profile for each of the Airlines
These are read from a their respective files (To be added)
This also can create a pop-up page for the profile
*/
public class AirlinerProfile {
  PImage logo, planePicture;
  float emissionPerDistanceUnit;
  int lastCrashDate, totalNumberOfCrashes;
  String name,description,foodMenu;
  
  
  AirlinerProfile(String logoFName, String planeFName, String mainFName){
    logo = loadImage(logoFName);
    planePicture = loadImage(planeFName);
    String[] desc = loadStrings(mainFName);
    name = desc[0];
    description = desc[0];
    foodMenu = desc[0];
    //Convert the rest
  
  }
  
  
}
