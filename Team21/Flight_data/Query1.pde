class Query1 {

  ArrayList<Datapoint> theData;
  int start;
  int amount;

  Query1(int start, int amount) {
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
    return airport.toArray(new String[airport.size()]);//converts to Array and returns it
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
}
