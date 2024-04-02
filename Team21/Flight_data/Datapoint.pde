//A version of the Datapoint Class that takes
//A String array of loaded data and a specific line

public class Datapoint {
  public String  FlightDate, IACA_Code_Marketing_Airline, Origin, OriginCityName, OriginStateName, Dest, DestinationCityName, DestinationStateName;
  public int  FlightNumber, OriginWac, DestWac, CRSDepTime, departure, CRSExcpetedArrivalTime, ArrivalTime;
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


    this.FlightDate =                  dataInString[0];
    this.IACA_Code_Marketing_Airline = dataInString[1];
    this.FlightNumber =                Integer.parseInt(dataInString[2]);



    this.Origin =                   dataInString[3];
    this.OriginCityName =           dataInString[4];
    this.OriginStateName =          dataInString[6];
    this.OriginWac =                Integer.parseInt(dataInString[7]);

    this.Dest =                     dataInString[8];
    this.DestinationCityName =      dataInString[9];
    this.DestinationStateName =     dataInString[11];
    this.DestWac =                  Integer.parseInt(dataInString[12]);

    if (dataInString[13].equals(""))
    {
      this.CRSDepTime =              -1;
    } else {
      this.CRSDepTime =              Integer.parseInt(dataInString[13]);
    }
    if (dataInString[14].equals(""))
    {
      this.departure =               -1;
    } else {
      this.departure =               Integer.parseInt(dataInString[14]);
    }


    if (dataInString[15].equals(""))
    {
      this.CRSExcpetedArrivalTime =  -1;
    } else {
      this.CRSExcpetedArrivalTime =  Integer.parseInt(dataInString[15]);
    }

    if (dataInString[16].equals(""))
    {
      this.ArrivalTime =              -1;
    } else {
      this.ArrivalTime =              Integer.parseInt(dataInString[16]);
    }


    this.distance =             distance;

    this.cancelled =            cancelled;
    this.diverted =             diverted;
  }
}

//A public function for intializing an arraylist of datapoints
//(EG: if you have a screen to represent 30 datapoints, use an arraylist of size 30)
ArrayList <Datapoint> initializeDataList (String []fileData, int start, int amount) {
  ArrayList <Datapoint> result = new ArrayList <Datapoint> (0);

  for (int i = start; i < amount; i ++) {
    Datapoint placeHolder = new Datapoint (fileData[i]);
    result.add(placeHolder);
  }
  return result;
}
Datapoint [] initializeDataArray (String []fileData, int start,int amount) {
  Datapoint [] result = new Datapoint [amount];

  for (int i = start; i < amount; i ++) {
    Datapoint placeHolder = new Datapoint (fileData[i]);
    result[i] = placeHolder;
  }
  return result;
}
