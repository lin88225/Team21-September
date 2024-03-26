class Query {
  /* getArrayAirports(): String[]
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
    theData = initializeDataList("flights100k.csv", start, amount);
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
    String states[]=getArrayAirports();
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
}
