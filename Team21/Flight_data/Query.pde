class Query {
  /*
   getArrayAirports(): String[]
   getArrayStates(): String[]
   getArrayCities(): String[]
   getArrayAirlines(): String[]
   getNumberFlightsPerAirport(): int[]
   getNumberFlightsPerState(): int[]
   getNumberFlightsPerCity(): int[]
   getNumberFlightsPerAirline(): int[]
   */
  ArrayList<Datapoint> theData;
  int start;
  int amount;

  Query(int start, int amount) {
    this.start=start;
    this.amount=amount;
    theData = initializeDataList(flightInfo, start, amount);
  }

  String[] getArrayAirports() {
    // Creates an ArrayList with unique airport values
    ArrayList<String> airport = new ArrayList<>();
    for (int i = 0; i < theData.size(); i++) {
      String value = theData.get(i).Origin;
      if (!airport.contains(value)) //checks if it does not contain the airport yet
        airport.add(value);
    }
    return sort(airport.toArray(new String[airport.size()]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayStates() {
    // Creates an ArrayList with unique states values
    ArrayList<String> state = new ArrayList<>();
    for (int i = 0; i < theData.size(); i++) {
      String value = theData.get(i).OriginStateName.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
      if (!state.contains(value)) //checks if it does not contain the state yet
        state.add(value);
    }
    return sort(state.toArray(new String[state.size()]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayCities() {
    // Creates an ArrayList with unique city values
    ArrayList<String> city = new ArrayList<>();
    for (int i = 0; i < theData.size(); i++) {
      String value = theData.get(i).OriginCityName.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
      if (!city.contains(value)) //checks if it does not contain the city yet
        city.add(value);
    }
    return sort(city.toArray(new String[city.size()]));//converts to Array and returns it in alphabetical order
  }

  String[] getArrayAirlines() {
    // Creates an ArrayList with unique airlines values
    ArrayList<String> airline = new ArrayList<>();
    for (int i = 0; i < theData.size(); i++) {
      String value = theData.get(i).IACA_Code_Marketing_Airline;
      if (!airline.contains(value)) //checks if it does not contain the airline yet
        airline.add(value);
    }
    return sort(airline.toArray(new String[airline.size()]));//converts to Array and returns it in alphabetical order
  }

  int [] getNumberFlightsPerAirport() {
    String airports[]=getArrayAirports();
    int[] flightCounts = new int[airports.length];
    for (int index = 0; index < flightCounts.length; index++) {
      int airportCounts=0;
      for (int i = 0; i < theData.size(); i++) {
        String origin = theData.get(i).Origin;
        if (airports[index].equals(origin))
          airportCounts++;
      }
      flightCounts[index]=airportCounts;
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each airport
  }

  int [] getNumberFlightsPerState() {
    String states[]=getArrayStates();
    int[] flightCounts = new int[states.length];
    for (int index = 0; index < flightCounts.length; index++) {
      int stateCounts=0;
      for (int i = 0; i < theData.size(); i++) {
        String origin = theData.get(i).OriginStateName;
        if (states[index].equals(origin))
          stateCounts++;
      }
      flightCounts[index]=stateCounts;
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each state
  }

  int [] getNumberFlightsPerCity() {
    String cities[]=getArrayCities();
    int[] flightCounts = new int[cities.length];
    for (int index = 0; index < flightCounts.length; index++) {
      int cityCounts=0;
      for (int i = 0; i < theData.size(); i++) {
        String origin = theData.get(i).OriginCityName;
        origin = origin.replaceAll("\"", "");//replaceAll() is used to remove "" from the String
        if (cities[index].equals(origin))
          cityCounts++;
      }
      flightCounts[index]=cityCounts;
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each city
  }

  int [] getNumberFlightsPerAirline() {
    String airlines[]=getArrayAirlines();
    int[] flightCounts = new int[airlines.length];
    for (int index = 0; index < flightCounts.length; index++) {
      int airlineCounts=0;
      for (int i = 0; i < theData.size(); i++) {
        String origin = theData.get(i).IACA_Code_Marketing_Airline;
        if (airlines[index].equals(origin))
          airlineCounts++;
      }
      flightCounts[index]=airlineCounts;
    }
    return flightCounts;//returns the flightCounts array containing the counts of flights for each airline
  }
  float [] calculateAverageDelay() {
    String [] airlineNames = getArrayAirlines();
    float [] result = new float[airlineNames.length];
    int [] numberOfFlightsPerAirline = getNumberFlightsPerAirline();
    int [] totalDelays = new int[airlineNames.length];
    for (int i = 0; i < theData.size(); i++)
    {
      int delay = theData.get(i).ArrivalTime - theData.get(i).CRSExcpetedArrivalTime;
      delay = (delay<-1200? -delay:delay);
      delay = (theData.get(i).ArrivalTime == -1? 2500: delay);
      for (int j = 0; j < airlineNames.length; j++)
      {
        if (theData.get(i).IACA_Code_Marketing_Airline.equals(airlineNames[j]) && delay != 2500)
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
      result[i] = (float)totalDelays[i]/(float)numberOfFlightsPerAirline[i];
    }
    return result;
  }
  int [] getCancellationsAndDiversions(String placeName) {
    int [] result = new int [3];
    for (int i = 0; i < theData.size(); i++)
    {
      if (placeName.equalsIgnoreCase(theData.get(i).OriginStateName) || placeName.equalsIgnoreCase(theData.get(i).OriginCityName) || placeName.equalsIgnoreCase(theData.get(i).IACA_Code_Marketing_Airline))
      {
        if (theData.get(i).cancelled) {
          result[1]++;
        } else if (theData.get(i).diverted) {
          result[2]++;
        } else {
          result[0]++;
        }
      }
    }
    return result;
  }
  float [] averageFlightDistance(){
    String [] airlineNames = getArrayAirlines();
    int [] numberOfFlightsAirline = getNumberFlightsPerAirline();
    float [] result = new float[airlineNames.length];
    float [] totalDistances = new float[airlineNames.length];
    for(int i = 0; i < theData.size(); i++)
    {
      float flightDistance = theData.get(i).distance;
      for(int j = 0; j < airlineNames.length; j++)
      {
        if(airlineNames[j].equals(theData.get(i).IACA_Code_Marketing_Airline))
        {
          totalDistances[j] += flightDistance;
        }
      }
    }
    for (int i = 0; i < airlineNames.length; i++)
    {
      result[i] = (totalDistances[i]/(float)numberOfFlightsAirline[i])*10000;
    }
    return result;
  }
}
