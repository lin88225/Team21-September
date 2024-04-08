/** A class used to calculate and sort data and then stores them into different arrays
 written by Katia Neli and Cara Saulnier, with efficiency edits written by Lloyd McNally
 */
import java.util.HashSet;
import java.util.Set;

class Query {
  /*
   getArrayAirports(): String[]
   getArrayStates(): String[]
   getArrayCities(): String[]
   getArrayAirlines(): String[]
   getArrayDates(): String []
   getNumberFlightsPerAirport(): int[]
   getNumberFlightsPerState(): int[]
   getNumberFlightsPerCity(): int[]
   getNumberFlightsPerAirline(): int[]
   getNumberFlightsPerAirportForEveryDay(): int[][]  // first index is the date, second is the airport
   getNumberFlightsPerCityForEveryDay(): int[][]  // first index is the date, second is the city
   getNumberFlightsPerStateForEveryDay(): int[][]  // first index is the date, second is the state
   calculateAverageDelay(): float[]
   getCancellationsAndDiversions(String placeName): int[]
   averageFlightDistance(): float[]
   */
  Datapoint [] theData;

  int start;
  int amount;

  Query(int start, int amount) {
    this.amount=amount;
    this.start = start;
    theData = initializeDataArray(flightInfo, start, amount);
  }

  //Used HashSet instead of ArrayList to improve efficiency of some methods
  //Katia Neli
  String[] getArrayAirports() {
    Set<String> airportSet = new HashSet<>(); // Use a Set to store unique airport values
    for (int i = 1; i < theData.length; i++) {
      airportSet.add(theData[i].Origin); // Add each airport to the Set
    }
    return sort(airportSet.toArray(new String[0]));
  }

  String[] getArrayStates() {
    Set<String> stateSet = new HashSet<>();
    for (int i = 1; i < theData.length; i++) {
      stateSet.add(theData[i].OriginStateName);
    }
    return sort(stateSet.toArray(new String[0]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayCities() {
    Set<String> citySet = new HashSet<>();
    for (int i = 1; i < theData.length; i++) {
      citySet.add(theData[i].OriginCityName);
    }
    return sort(citySet.toArray(new String[0]));
  }

  String[] getArrayAirlines() {
    Set<String> airlineSet = new HashSet<>();
    for (int i = 1; i < theData.length; i++) {
      airlineSet.add(theData[i].IACA_Code_Marketing_Airline);
    }
    return sort(airlineSet.toArray(new String[0]));
  }

  String[] getArrayDates() {
    Set<String> dateSet = new HashSet<>();
    for (int i = 1; i < theData.length; i++) {
      dateSet.add(theData[i].FlightDate);
    }
    return dateSet.toArray(new String[0]);
  }

  int [] getNumberFlightsPerAirport() {
    String airports[]=getArrayAirports();
    int[] flightCounts = new int[airports.length];
    /*
     Code changed by L.Mc
     Function now checks all airports for each datapoint with break function
     Improved performance
     */
    for (int i = 1; i < theData.length; i++) {
      String origin = theData[i].Origin;
      origin = origin.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
      for (int index = 0; index < airports.length; index++) {
        if (airports[index].equals(origin)) {
          flightCounts[index] ++;
          break;
        }
      }
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each airport
  }

  int [] getNumberFlightsPerState() {
    String states[]=getArrayStates();
    int[] flightCounts = new int[states.length];
    /*
     Code changed by L.Mc
     Function now checks all states for each datapoint with break function
     Improved performance
     */
    for (int i = 1; i < theData.length; i++) {
      String origin = theData[i].OriginStateName;
      origin = origin.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
      for (int index = 0; index < states.length; index++) {
        if (states[index].equals(origin)) {
          flightCounts[index] ++;
          break;
        }
      }
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each state
  }

  int [] getNumberFlightsPerCity() {
    String cities[]=getArrayCities();
    int[] flightCounts = new int[cities.length];
    /*
     Code changed by L.Mc
     Function now checks all cities for each datapoint with break function
     Improved performance
     */
    for (int i = 1; i < theData.length; i++) {
      String origin = theData[i].OriginCityName;
      origin = origin.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
      for (int index = 0; index < cities.length; index++) {
        if (cities[index].equals(origin)) {
          flightCounts[index] ++;
          break;
        }
      }
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each city
  }

  int [] getNumberFlightsPerAirline() {
    String airlines[]=getArrayAirlines();
    int[] flightCounts = new int[airlines.length];
    /*
     Code changed by L.Mc
     Function now checks all states for each datapoint with break function
     Slightly improved performance
     */
    for (int i = 1; i < theData.length; i++) {
      String origin = theData[i].IACA_Code_Marketing_Airline;
      origin = origin.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
      for (int index = 0; index < airlines.length; index++) {
        if (airlines[index].equals(origin)) {
          flightCounts[index] ++;
          break;
        }
      }
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each airline
  }

  int[][] getNumberFlightsPerAirportForEveryDay() { // first index is the date, second is the airport
    String airports[]=getArrayAirports();
    String dates [] =  getArrayDates();
    int answer [][] = new int [dates.length][airports.length];
    for (int i = 1; i < theData.length; i++)
    {
      for (int days = 0; days < answer.length; days++)
        for (int airportInts = 0; airportInts < answer[days].length; airportInts++)
        {
          if (theData[i].FlightDate.equals(dates[days]) && theData[i].Origin.equals(airports[airportInts]))
          {
            answer[days][airportInts]++;
            break;
          }
        }
    }
    return answer;
  }

  int[][] getNumberFlightsPerStateForEveryDay() { // first index is the date, second is the state
    String states[]=getArrayStates();
    String dates [] =  getArrayDates();
    int answer [][] = new int [dates.length][states.length];
    for (int i = 1; i < theData.length; i++)
    {
      for (int days = 0; days < answer.length; days++)
        for (int stateInts = 0; stateInts < answer[days].length; stateInts++)
        {
          if (theData[i].FlightDate.equals(dates[days]) && theData[i].OriginStateName.equals(states[stateInts]))
          {
            answer[days][stateInts]++;
            break;
          }
        }
    }
    return answer;
  }

  int[][] getNumberFlightsPerCityForEveryDay() { // first index is the date, second is the city
    String cities[]=getArrayCities();
    String dates [] =  getArrayDates();
    int answer [][] = new int [dates.length][cities.length];
    for (int i = 1; i < theData.length; i++)
    {
      for (int days = 0; days < answer.length; days++)
        for (int cityInts = 0; cityInts < answer[days].length; cityInts++)
        {
          if (theData[i].FlightDate.equals(dates[days]) && theData[i].OriginCityName.equals(cities[cityInts]))
          {
            answer[days][cityInts]++;
            break;
          }
        }
    }
    return answer;
  }

  float [] calculateAverageDelay() {
    String [] airlineNames = getArrayAirlines();
    float [] result = new float[airlineNames.length];
    int [] numberOfFlightsPerAirline = getNumberFlightsPerAirline();
    int [] totalDelays = new int[airlineNames.length];
    for (int i = 1; i < theData.length; i++)
    {
      int delay = theData[i].ArrivalTime - theData[i].CRSExcpetedArrivalTime;
      delay = (delay<-1200? -delay:delay);
      delay = (theData[i].ArrivalTime == -1? 2500: delay);
      for (int j = 0; j < airlineNames.length; j++)
      {
        if (theData[i].IACA_Code_Marketing_Airline.equals(airlineNames[j]) && delay != 2500)
        {
          totalDelays[j] = delay;
        } else if (delay == 2500)
        {
          numberOfFlightsPerAirline[j] --;
        }
      }
    }
    for (int i = 0; i < airlineNames.length; i++)
    {
      result[i] = ((float)totalDelays[i]/(float)numberOfFlightsPerAirline[i])*60;
    }
    return result;
  }

  int [] getCancellationsAndDiversions(String placeName) {
    int [] result = new int [3];
    for (int i = 1; i < theData.length; i++)
    {
      if (placeName.equals(theData[i].OriginStateName) || placeName.equals(theData[i].OriginCityName) || placeName.equals(theData[i].IACA_Code_Marketing_Airline))
      {
        if (theData[i].cancelled) {
          result[1]++;
        } else if (theData[i].diverted) {
          result[2]++;
        } else {
          result[0]++;
        }
      }
    }
    return result;
  }

  float [] averageFlightDistance() {
    String [] airlineNames = getArrayAirlines();
    int [] numberOfFlightsAirline = getNumberFlightsPerAirline();
    float [] result = new float[airlineNames.length];
    float [] totalDistances = new float[airlineNames.length];
    for (int i = 1; i < theData.length; i++)
    {
      float flightDistance = theData[i].distance;
      for (int j = 0; j < airlineNames.length; j++)
      {
        if (airlineNames[j].equals(theData[i].IACA_Code_Marketing_Airline))
        {
          totalDistances[j] += flightDistance;
        }
      }
    }
    for (int i = 0; i < airlineNames.length; i++)
    {
      result[i] = (totalDistances[i]/(float)numberOfFlightsAirline[i]);
    }
    return result;
  }
}
