/**
 Quicksort Class with Datapoint sorting functions
 Aisling McNamara 26/3/2024
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
