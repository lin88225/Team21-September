//A version of the Datapoint Class that takes
//A String array of loaded data and a specific line

public class Datapoint {
  public String  FlightDate, IACA_Code_Marketing_Airline, Origin, OriginCityName, OriginStateName, Dest, DestinationCityName, DestinationStateName;
  public int  FlightNumber, OriginWac, DestWac, CRSDepTime, departure, CRSExcpetedArrivalTime, ArrivalTime;
  public float distance;
  public boolean cancelled, diverted;

  Datapoint (String loadedData[], int line) {

    
    //The raw data
    String dataInString[] = loadedData[line].split(",");
    
    //The integers that are parsed
    int parsedNumbers[] = new int [8];

    parsedNumbers[0] = Integer.parseInt(dataInString[2]);

    parsedNumbers[1] = Integer.parseInt(dataInString[7]);
    parsedNumbers[2] = Integer.parseInt(dataInString[12]);
    try {
      parsedNumbers[3] = Integer.parseInt(dataInString[13]);
    }
    catch (NumberFormatException e) {
      parsedNumbers[3] = -1;
    }

    try {
      parsedNumbers[4] = Integer.parseInt(dataInString[14]);
    }
    catch (NumberFormatException e) {
      parsedNumbers[4] = -1;
    }

    try {
      parsedNumbers[5] = Integer.parseInt(dataInString[15]);
    }
    catch (NumberFormatException e) {
      parsedNumbers[5] = -1;
    }
    try {
      parsedNumbers[6] = Integer.parseInt(dataInString[16]);
    }
    catch (NumberFormatException e) {
      parsedNumbers[6] = -1;
    }



    float distance = Float.parseFloat(dataInString[19]);
    boolean cancelled = (Float.parseFloat(dataInString[17]) == 1);
    boolean diverted = (Float.parseFloat(dataInString[18]) == 1);
    dataInString[4] = dataInString [4] + dataInString[5];
    dataInString[8] = dataInString [8] + dataInString[9];

    this.FlightDate =                  dataInString[0];
    this.IACA_Code_Marketing_Airline = dataInString[1];
    this.FlightNumber =                parsedNumbers[0];


    this.Origin =                   dataInString[3];
    this.OriginCityName =           dataInString[4];
    this.OriginStateName =          dataInString[5];
    this.OriginWac =                parsedNumbers[1];

    this.Dest =                     dataInString[7];
    this.DestinationCityName =      dataInString[8];
    this.DestinationStateName =     dataInString[9];
    this.DestWac =                  parsedNumbers[2];

    this.CRSDepTime =               parsedNumbers[3];
    this.departure =                parsedNumbers[4];

    this.CRSExcpetedArrivalTime =   parsedNumbers[5];
    this.ArrivalTime =              parsedNumbers[6];

    this.distance =             distance;

    this.cancelled =            cancelled;
    this.diverted =             diverted;
  }
}

//A public function for intializing an arraylist of datapoints
//(EG: if you have a screen to represent 30 datapoints, use an arraylist of size 30)
ArrayList <Datapoint> initializeDataList (String fileName, int start, int amount) {
  ArrayList <Datapoint> result = new ArrayList <Datapoint> (0);

  for (int i = start; i < amount; i ++) {
    Datapoint placeHolder = new Datapoint (loadStrings(fileName), i);
    result.add(placeHolder);
  }
  return result;
}
Datapoint [] initializeDataArray (String fileName, int start, int amount) {
  Datapoint [] result = new Datapoint [amount];

  for (int i = start; i < amount; i ++) {
    Datapoint placeHolder = new Datapoint (loadStrings(fileName), i);
    result[i] = placeHolder;
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
 println("Value [" + j + "]:" + dataInString[j]);
 }
 
 Datapoint(
 2, dataInString[1], dataInString[2], dataInString[3], dataInString[4], dataInString[6], dataInString[7], dataInString[8],
 eI[0], eI[1], eI[2], eI[3], eI[4], eI[5], eI[6],
 distance,
 cancelled, diverted);
 
 */
