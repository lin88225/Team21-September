/**
 Aisling McNamara 26/3/2024
 Quicksort Class with Datapoint sorting functions

 Implements Quicksort routines on Arrival Time variable and Departure Time variables in the Datapoint class. 
 Quicksort function swaps higher numbers on the left with lower numbers on the right of the array and continually partitions the array 
 to reapply the quicksort function until complete. This method is used for both Arrival and Departure time. 

 */

void quickSortByIntArrivalTime(ArrayList<Datapoint> flights, int low, int high) {
  if (low < high) {
    int pi = partitionByIntArrivalTime(flights, low, high);
    quickSortByIntArrivalTime(flights, low, pi - 1);
    quickSortByIntArrivalTime(flights, pi + 1, high);
  }
}

int partitionByIntArrivalTime(ArrayList<Datapoint> flights, int low, int high) {
  int pivot = flights.get(high).ArrivalTime;
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (flights.get(j).ArrivalTime < pivot) {
      i++;
      Datapoint temp = flights.get(i);
      flights.set(i, flights.get(j));
      flights.set(j, temp);
    }
  }
  Datapoint temp = flights.get(i + 1);
  flights.set(i + 1, flights.get(high));
  flights.set(high, temp);
  return i + 1;
}

void quickSortByCRSDepTime(ArrayList<Datapoint> flights, int low, int high) {
  if (low < high) {
    int pi = partitionByCRSDepTime(flights, low, high);
    quickSortByCRSDepTime(flights, low, pi - 1);
    quickSortByCRSDepTime(flights, pi + 1, high);
  }
}

int partitionByCRSDepTime(ArrayList<Datapoint> flights, int low, int high) {
  int pivot = flights.get(high).CRSDepTime;
  int i = low - 1;
  for (int j = low; j < high; j++) {
    if (flights.get(j).CRSDepTime < pivot) {
      i++;
      Datapoint temp = flights.get(i);
      flights.set(i, flights.get(j));
      flights.set(j, temp);
    }
  }
  Datapoint temp = flights.get(i + 1);
  flights.set(i + 1, flights.get(high));
  flights.set(high, temp);
  return i + 1;
}
