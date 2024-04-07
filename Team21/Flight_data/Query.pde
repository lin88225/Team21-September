class Query {//need to modify functions...Hash map/sets
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
   getNumberFlightsPerDate(): int[]                          // seems obsolete
   getNumberFlightsPerStatePerDay(String date): int[]        // seems obsolete
   getNumberFlightsPerCityPerDay(String date): int[]         // seems obsolete
   getNumberFlightsPerAirportPerDay(String date): int[]      // seems obsolete
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

  String[] getArrayAirports() {
    // Creates an ArrayList with unique airport values
    ArrayList<String> airport = new ArrayList<>();
    for (int i = 1; i < theData.length; i++) {
      String value = theData[i].Origin;
      if (!airport.contains(value)) //checks if it does not contain the airport yet
        airport.add(value);
    }
    return sort(airport.toArray(new String[airport.size()]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayStates() {
    // Creates an ArrayList with unique states values
    ArrayList<String> state = new ArrayList<>();
    for (int i = 1; i < theData.length; i++) {
      String value = theData[i].OriginStateName;
      if (!state.contains(value)) //checks if it does not contain the state yet
        state.add(value);
    }
    return sort(state.toArray(new String[state.size()]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayCities() {
    // Creates an ArrayList with unique city values
    ArrayList<String> city = new ArrayList<>();
    for (int i = 1; i < theData.length; i++) {
      String value = theData[i].OriginCityName.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
      if (!city.contains(value)) //checks if it does not contain the city yet
        city.add(value);
    }
    return sort(city.toArray(new String[city.size()]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayAirlines() {
    // Creates an ArrayList with unique airlines values
    ArrayList<String> airline = new ArrayList<>();
    for (int i = 1; i < theData.length; i++) {
      String value = theData[i].IACA_Code_Marketing_Airline;
      if (!airline.contains(value)) //checks if it does not contain the airline yet
        airline.add(value);
    }
    return sort(airline.toArray(new String[airline.size()]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayDates() {
    // Creates an ArrayList with unique airlines values
    ArrayList<String> date = new ArrayList<>();
    for (int i = 1; i < theData.length; i++) {
      String value = theData[i].FlightDate;
      if (!date.contains(value)) //checks if it does not contain the airline yet
        date.add(value);
    }
    return date.toArray(new String[date.size()]);//converts to Array and returns it in alphabetical order
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
      if (placeName.equals(theData[i].OriginStateName) || placeName.equals(theData[i].OriginCityName.replaceAll("\"", "")) || placeName.equals(theData[i].IACA_Code_Marketing_Airline))
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
