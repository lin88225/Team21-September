class Datapoint {
  String FlightDate;
  String IACA_Code_Marketing_Airline;
  int Flight_Number_Marketing_Airline;
  String Origin;
  String OriginCityName;
  String OriginState;
  String OriginStateAbr;
  int OriginWac;
  String Dest;
  String DestinationCityName;
  String DestState;
  int DestWac;
  int CRSDepTime;
  int CRSExpectedArrivalTime;
  int intArrivalTime;
  int cancelled;
  int diverted;
  int distance;
  int delay;

  Datapoint(String FlightDate, String IACA_Code_Marketing_Airline, int Flight_Number_Marketing_Airline, String Origin, String OriginCityName, String OriginState, String OriginStateAbr, 
  int OriginWac, String Dest, String DestinationCityName, String DestState, int DestWac, int CRSDeptTime, int CRSExpectedArrivalTime, 
  int intArrivalTime, int cancelled, int diverted, int distance, int delay){
    this.FlightDate = FlightDate;
    this.IACA_Code_Marketing_Airline = IACA_Code_Marketing_Airline;
    this.Flight_Number_Marketing_Airline = Flight_Number_Marketing_Airline;
    this.Origin = Origin;
    this.OriginCityName = OriginCityName;
    this.OriginState = OriginState;
    this.OriginStateAbr = OriginStateAbr;
    this.OriginWac = OriginWac;
    this.Dest = Dest;
    this.DestinationCityName = DestinationCityName;
    this.DestState = DestState;
    this.DestWac = DestWac;
    this.CRSDepTime = CRSDepTime;
    this.CRSExpectedArrivalTime = CRSExpectedArrivalTime;
    this.intArrivalTime = intArrivalTime;
    this.cancelled = cancelled;
    this.diverted = diverted;
    this.distance = distance;
    this.delay = delay;
    
  }
}
