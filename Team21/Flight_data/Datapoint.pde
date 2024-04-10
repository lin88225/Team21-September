/**
 A version of the Datapoint Class that takes
 A String array of loaded data and a specific line
 Code initally written by Lloyd McNally
 Small mistakes regarding numbers were fixed, with obsolete code removed. The functions calling the code were changed as well as changing the constructor to only read the file once - Cara Saulnier
 */

public class Datapoint {
  public String  flightDate, iACA_Code_Marketing_Airline, origin, originCityName, originStateName, dest, destinationCityName, destinationStateName;
  public int  flightNumber, originWac, destWac, cRSDepTime, departure, cRSExcpetedArrivalTime, arrivalTime;
  public float distance;
  public boolean cancelled, diverted;

  Datapoint (String loadedData) {
    //The raw data
    String dataInString[] = loadedData.split(",");

    float distance = Float.parseFloat(dataInString[19]);
    boolean cancelled = (Float.parseFloat(dataInString[17]) == 1);
    boolean diverted = (Float.parseFloat(dataInString[18]) == 1);
    dataInString[4] = dataInString [4] + dataInString[5];
    dataInString[9] = dataInString [9] + dataInString[10];


    this.flightDate =                  dataInString[0].replaceAll(" 12:00:00 AM", "");//added a space in front of 12 because otherwise it wouldn't read the date in the TextWidget
    this.iACA_Code_Marketing_Airline = dataInString[1];
    this.flightNumber =                Integer.parseInt(dataInString[2]);



    this.origin =                   dataInString[3];
    this.originCityName =           dataInString[4].replaceAll("\"", "");//replaceAll() is used to remove "" from the String
    this.originStateName =          dataInString[6];
    this.originWac =                Integer.parseInt(dataInString[7]);

    this.dest =                     dataInString[8];
    this.destinationCityName =      dataInString[9].replaceAll("\"", "");//replaceAll() is used to remove "" from the String
    this.destinationStateName =     dataInString[11];
    this.destWac =                  Integer.parseInt(dataInString[12]);

    if (dataInString[13].equals(""))
    {
      this.cRSDepTime =              -1;
    } else {
      this.cRSDepTime =              Integer.parseInt(dataInString[13]);
    }
    if (dataInString[14].equals(""))
    {
      this.departure =               -1;
    } else {
      this.departure =               Integer.parseInt(dataInString[14]);
    }


    if (dataInString[15].equals(""))
    {
      this.cRSExcpetedArrivalTime =  -1;
    } else {
      this.cRSExcpetedArrivalTime =  Integer.parseInt(dataInString[15]);
    }

    if (dataInString[16].equals(""))
    {
      this.arrivalTime =              -1;
    } else {
      this.arrivalTime =              Integer.parseInt(dataInString[16]);
    }


    this.distance =             distance;

    this.cancelled =            cancelled;
    this.diverted =             diverted;
  }
}
/*
 Written by Lloyd McNally
 Made more efficient by Cara Saulnier
 A public function for intializing an arraylist of datapoints
 (EG: if you have a screen to represent 30 datapoints, use an arraylist of size 30)
 */
ArrayList <Datapoint> initializeDataList (String []fileData, int amount) {
  ArrayList <Datapoint> result = new ArrayList <Datapoint> (0);

  for (int i = 1; i < amount; i ++) {
    Datapoint placeHolder = new Datapoint (fileData[i]);
    result.add(placeHolder);
  }
  return result;
}

Datapoint [] initializeDataArray (String []fileData, int start, int amount) {
  Datapoint [] result = new Datapoint [amount];

  for (int i = start; i < amount; i ++) {
    Datapoint placeHolder = new Datapoint (fileData[i]);
    result[i] = placeHolder;
  }
  return result;
}
