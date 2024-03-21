//A version of the Datapoint Class that takes 
//A String array of loaded data and a specific line 

public class Datapoint {
  public String  FlightDate, IACA_Code_Marketing_Airline, Origin, OriginCityName, OriginStateName, Dest, DestinationCityName, DestinationStateName;
  public int  FlightNumber, OriginWac, DestWac, CRSDepTime, departure, CRSExcpetedArrivalTime, ArrivalTime;
  public float distance;
  public boolean cancelled, diverted;

  Datapoint (String loadedData[], int line) {

    String eP[] = loadedData[line].split(",");
    int eI[] = new int [8];

    eI[0] = Integer.parseInt(eP[2]);

    eI[1] = Integer.parseInt(eP[7]);
    eI[2] = Integer.parseInt(eP[12]);
    try {
      eI[3] = Integer.parseInt(eP[13]);
    }
    catch (NumberFormatException e) {
      eI[3] = -1;
    }

    try {
      eI[4] = Integer.parseInt(eP[14]);
    }
    catch (NumberFormatException e) {
      eI[4] = -1;
    }

    try {
      eI[5] = Integer.parseInt(eP[15]);
    }
    catch (NumberFormatException e) {
      eI[5] = -1;
    }
    try {
      eI[6] = Integer.parseInt(eP[16]);
    }
    catch (NumberFormatException e) {
      eI[6] = -1;
    }



    float distance = Float.parseFloat(eP[19]);
    boolean cancelled = (Float.parseFloat(eP[17]) == 1);
    boolean diverted = (Float.parseFloat(eP[18]) == 1);
    eP[4] = eP [4] + eP[5];
    eP[8] = eP [8] + eP[9];
    
    this.FlightDate =           eP[0];
    this.IACA_Code_Marketing_Airline =           eP[1];
    this.FlightNumber =         eI[0];


    this.Origin =               eP[3];
    this.OriginCityName =                eP[4];
    this.OriginStateName =               eP[5];
    this.OriginWac =       eI[1];

    this.Dest =                 eP[7];
    this.DestinationCityName =                eP[8];
    this.DestinationStateName =               eP[9];
    this.DestWac =       eI[2];

    this.CRSDepTime =   eI[3];
    this.departure =            eI[4];

    this.CRSExcpetedArrivalTime =     eI[5];
    this.ArrivalTime =              eI[6];

    this.distance =             distance;

    this.cancelled =            cancelled;
    this.diverted =             diverted;

  }
}

//A public function for intializing an arraylist of datapoints 
//(EG: if you have a screen to represent 30 datapoints, use an arraylist of size 30)
ArrayList <Datapoint> initializeData (String fileName, int start, int amount) {
  ArrayList <Datapoint> result = new ArrayList <Datapoint> (0);

  for (int i = start; i < amount; i ++) {
    Datapoint placeHolder = new Datapoint (loadStrings(fileName), i);
    result.add(placeHolder);
  }
  return result;
}



/*
Comments:
  The try catch is used such that any fields that MIGHT be empty are replaced
  With an error code (-1)


Scrap Code:
    //properData.add(placeHolder);
    //println (properData.get(i-1).FlightDate);
    //theData = loadStrings("flights100k.csv");
  
    for (int j = 0; j < 20; j ++) {
     println("Value [" + j + "]:" + eP[j]);
     }

    Datapoint(
     2, eP[1], eP[2], eP[3], eP[4], eP[6], eP[7], eP[8],
     eI[0], eI[1], eI[2], eI[3], eI[4], eI[5], eI[6],
     distance,
     cancelled, diverted);
     
*/
