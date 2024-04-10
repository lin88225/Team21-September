/**
 A function to create the dropdown array that gets displayed to the first screen to select data to display
 Some dropdowns may only have one value selected, and some can have multiple
 Cara Saulnier
 */
void createDropdownArray()
{
  dropdownArray = new Dropdown[8];
  String [] airlines = q.getArrayAirlines();
  for (int i = 0; i < dropdownArray.length; i++)
  {
    switch(i)
    {
    case 7:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2-4*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of flights per state", states, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 6:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2-4*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of flights per city", cities, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 5:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2-2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of flights\nper airport", airports, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 4:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2-2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Average delay per airline", airlines, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, true);

      break;
    case 3:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of cancellations and\ndiversions per state", states, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 2:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of cancellations and\ndiversions per city", cities, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 1:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2+2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of cancellations and\ndiversions per airline", airlines, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 0:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2+2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Average flight\ndistance per airline", airlines, POLO_BLUE, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    default:
    }
  }
  /*
  Created and initialised a new array of dropdowns for screen number 6 based on what Cara Saulnier did for the others in the code above
   Katia Neli
   */
  dropdownArrayForDateRange=new Dropdown[3];
  for (int index = 0; index < dropdownArray.length; index++)
  {
    switch(index)
    {
    case 0:
      dropdownArrayForDateRange[index] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH+130, SCREENY/2-(4*DROPDOWN_HEIGHT+17), DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "States", states, color(171, 177, 207), COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 1:
      dropdownArrayForDateRange[index] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH+130, SCREENY/2-2*DROPDOWN_HEIGHT+48, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Cities", cities, color(171, 177, 207), COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 2:
      dropdownArrayForDateRange[index] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH+130, SCREENY/2+113, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Airports", airports, color(171, 177, 207), COLUMBIA_BLUE, DENIM, arial, false);
      break;
    default:
    }
  }
  /*
  creating dropdown array for the map screen
   Michael Moore
   */
  mapDropdown = new Dropdown[2];
  mapDropdown[0] = new Dropdown(SCREENX/2 - DROPDOWN_WIDTH + 130, SCREENY/2-(3*DROPDOWN_HEIGHT+17), DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
    "Select Origin", states, color(171, 177, 207), COLUMBIA_BLUE, DENIM, arial, false);
  mapDropdown[1] = new Dropdown(SCREENX/2 + DROPDOWN_WIDTH, SCREENY/2 -(3*DROPDOWN_HEIGHT+17), DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
    "Select Destination", states, color(171, 177, 207), COLUMBIA_BLUE, DENIM, arial, false);
}



/* Two functions:
 One is to initialise the first screen only, which contains the dropdown menus
 The second function initialises all other screens when they need to be created. i.e. when the arrows are clicked to called screen 3, the third screen will be created with its data
 and will be drawn
 Cara Saulnier
 */

void createFirstScreens() {
  /*
  modified screenIDs to add as screen(0) the initial page and as screen(1) the homepage with all the dropdowns
   Katia Neli
   */
  screenArray[0] = new Screen(0);
  screenArray[1] = new Screen(1, dropdownArray);
}

// function to create Screens
void createScreens(int i) // i is the variable that decides which screen will be drawn
{
  if (i == 2)// A screen displaying the number of flights per state, city, and airport
  {
    screenArray[i] = new Screen(i);
    ArrayList <Integer> pieChartValues1 = new ArrayList <Integer>(0);
    ArrayList <String> pieChartDescriptions1 = new ArrayList <String>(0);
    String title1 = "Number of flights per state";
    ArrayList <Integer> pieChartValues2 = new ArrayList <Integer>(0);
    ArrayList <String> pieChartDescriptions2 = new ArrayList <String>(0);
    String title2 = "Number of flights per city";
    ArrayList <Integer> pieChartValues3 = new ArrayList <Integer>(0);
    ArrayList <String> pieChartDescriptions3 = new ArrayList <String>(0);
    String title3 = "Number of flights per airport";
    for (int j = 0; j < dropdownArray[7].dropdownDisplay.length; j++)
    {
      if (dropdownArray[7].clickMenu[j] % 2==0)
      {
        pieChartValues1.add(numFlightsState[j]);
        pieChartDescriptions1.add(dropdownArray[7].dropdownDisplay[j]);
      }
    }
    for (int j = 0; j < dropdownArray[6].dropdownDisplay.length; j++)
    {
      if (dropdownArray[6].clickMenu[j] % 2==0)
      {
        pieChartValues2.add(numFlightsCity[j]);
        pieChartDescriptions2.add(dropdownArray[6].dropdownDisplay[j]);
      }
    }
    for (int j = 0; j < dropdownArray[5].dropdownDisplay.length; j++)
    {
      if (dropdownArray[5].clickMenu[j] % 2==0)
      {
        pieChartValues3.add(numFlightsAirport[j]);
        pieChartDescriptions3.add(dropdownArray[5].dropdownDisplay[j]);
      }
    }
    int [] pieChartInts1 = new int[pieChartValues1.size()];
    int [] pieChartInts2 = new int[pieChartValues2.size()];
    int [] pieChartInts3 = new int[pieChartValues3.size()];
    for (int j = 0; j < pieChartInts1.length; j++)
    {
      pieChartInts1[j] = pieChartValues1.get(j);
    }
    for (int j = 0; j < pieChartInts2.length; j++)
    {
      pieChartInts2[j] = pieChartValues2.get(j);
    }
    for (int j = 0; j < pieChartInts3.length; j++)
    {
      pieChartInts3[j] = pieChartValues3.get(j);
    }
    String [] pieChartLabels1 = pieChartDescriptions1.toArray(new String[0]);
    String [] pieChartLabels2 = pieChartDescriptions2.toArray(new String[0]);
    String [] pieChartLabels3 = pieChartDescriptions3.toArray(new String[0]);
    screenArray[i].addPieChart(pieChartInts1, 200, SCREENX/4, SCREENY/3+30, pieChartLabels1, title1);
    screenArray[i].addPieChart(pieChartInts2, 200, SCREENX/2+170, SCREENY/3+30, pieChartLabels2, title2);
    screenArray[i].addPieChart(pieChartInts3, 200, SCREENX/4, SCREENY/2+180, pieChartLabels3, title3);
  } else if (i == 3) // displays the average delay per airline

  {
    screenArray[i] = new Screen(i);
    ArrayList <Float> barChartXValues = new ArrayList <Float>(0);
    ArrayList <String> barChartYValues = new ArrayList <String>(0);
    String title = "Average delay per airline";
    String descriptionOfX = "Average delay (hours)";
    String descriptionOfY = "Airlines";
    for (int j = 0; j < dropdownArray[4].dropdownDisplay.length; j++)
    {
      if (dropdownArray[4].clickMenu[j] % 2 ==0)
      {
        barChartXValues.add(averageFlightDelay[j]);
        barChartYValues.add(dropdownArray[4].dropdownDisplay[j]);
      }
    }
    String [] barChartValuesY = barChartYValues.toArray(new String[0]);
    float [] barChartValuesX = new float [barChartXValues.size()];
    for (int j = 0; j < barChartValuesX.length; j++)
    {
      barChartValuesX[j] = barChartXValues.get(j);
    }
    screenArray[i].addBarChart(barChartValuesX, barChartValuesY, SCREENX/4, SCREENY/3, title, descriptionOfX, descriptionOfY);
  } else if (i ==4) // displays the number of flights departed, cancelled, or diverted for state, city, and airport

  {
    screenArray[i] = new Screen(i);
    ArrayList <Integer> barChartValues1 = new ArrayList <Integer>(0);
    ArrayList <String> barChartDescriptions1 = new ArrayList <String>(0);
    String title1 = "Number of departed, cancelled, and diverted per state";
    ArrayList <Integer> barChartValues2 = new ArrayList <Integer>(0);
    ArrayList <String> barChartDescriptions2 = new ArrayList <String>(0);
    String title2 = "Number of flights departed, cancelled, and diverted per city";
    ArrayList <Integer> barChartValues3 = new ArrayList <Integer>(0);
    ArrayList <String> barChartDescriptions3 = new ArrayList <String>(0);
    String title3 = "Number of departed, cancelled, and diverted per airline";
    for (int j = 0; j < dropdownArray[3].dropdownDisplay.length; j++)
    {
      if (dropdownArray[3].clickMenu[j] % 2==0)
      {
        barChartValues1.add(q.getCancellationsAndDiversions(dropdownArray[3].dropdownDisplay[j])[0]);
        barChartValues1.add(q.getCancellationsAndDiversions(dropdownArray[3].dropdownDisplay[j])[1]);
        barChartValues1.add(q.getCancellationsAndDiversions(dropdownArray[3].dropdownDisplay[j])[2]);
        barChartDescriptions1.add("");
        barChartDescriptions1.add(dropdownArray[3].dropdownDisplay[j]);
        barChartDescriptions1.add("");
      }
    }
    for (int j = 0; j < dropdownArray[2].dropdownDisplay.length; j++)
    {
      if (dropdownArray[2].clickMenu[j] % 2==0)
      {
        barChartValues2.add(q.getCancellationsAndDiversions(dropdownArray[2].dropdownDisplay[j])[0]);
        barChartValues2.add(q.getCancellationsAndDiversions(dropdownArray[2].dropdownDisplay[j])[1]);
        barChartValues2.add(q.getCancellationsAndDiversions(dropdownArray[2].dropdownDisplay[j])[2]);
        barChartDescriptions2.add("");
        barChartDescriptions2.add(dropdownArray[2].dropdownDisplay[j]);
        barChartDescriptions2.add("");
      }
    }
    for (int j = 0; j < dropdownArray[1].dropdownDisplay.length; j++)
    {
      if (dropdownArray[1].clickMenu[j] % 2==0)
      {
        barChartValues3.add(q.getCancellationsAndDiversions(dropdownArray[1].dropdownDisplay[j])[0]);
        barChartValues3.add(q.getCancellationsAndDiversions(dropdownArray[1].dropdownDisplay[j])[1]);
        barChartValues3.add(q.getCancellationsAndDiversions(dropdownArray[1].dropdownDisplay[j])[2]);
        barChartDescriptions3.add("");
        barChartDescriptions3.add(dropdownArray[1].dropdownDisplay[j]);
        barChartDescriptions3.add("");
      }
    }
    float [] barChartInts1 = new float[barChartValues1.size()];
    float [] barChartInts2 = new float[barChartValues2.size()];
    float [] barChartInts3 = new float[barChartValues3.size()];
    for (int j = 0; j < barChartInts1.length; j++)
    {
      barChartInts1[j] = barChartValues1.get(j);
    }
    for (int j = 0; j < barChartInts2.length; j++)
    {
      barChartInts2[j] = barChartValues2.get(j);
    }
    for (int j = 0; j < barChartInts3.length; j++)
    {
      barChartInts3[j] = barChartValues3.get(j);
    }
    String [] barChartLabels1 = barChartDescriptions1.toArray(new String[0]);
    String [] barChartLabels2 = barChartDescriptions2.toArray(new String[0]);
    String [] barChartLabels3 = barChartDescriptions3.toArray(new String[0]);
    if (barChartLabels1.length !=0)
    {

      screenArray[i].addBarChart(barChartInts1, barChartLabels1, SCREENX/4, 150, title1, "Number of flights cancelled", "");
    }
    if (barChartLabels2.length !=0) {
      screenArray[i].addBarChart(barChartInts2, barChartLabels2, SCREENX/4, 300, title2, "Number of flights cancelled", "");
    }
    if (barChartLabels3.length !=0) {
      screenArray[i].addBarChart(barChartInts3, barChartLabels3, SCREENX/4, 450, title3, "Number of flights cancelled", "");
    }
  } else if (i ==5) // calculates the average flight distance

  {
    screenArray[i] = new Screen(i);
    ArrayList <Float> barChartXValues = new ArrayList <Float>(0);
    ArrayList <String> barChartYValues = new ArrayList <String>(0);
    String title = "Average distance per airline";
    String descriptionOfX = "Average distance (miles)";
    String descriptionOfY = "Airlines";
    for (int j = 0; j < dropdownArray[0].dropdownDisplay.length; j++)
    {
      if (dropdownArray[0].clickMenu[j] % 2 ==0)
      {
        barChartXValues.add(averageFlightDistance[j]);
        barChartYValues.add(dropdownArray[0].dropdownDisplay[j]);
      }
    }
    String [] barChartValuesY = barChartYValues.toArray(new String[0]);
    float [] barChartValuesX = new float [barChartXValues.size()];
    for (int j = 0; j < barChartValuesX.length; j++)
    {
      barChartValuesX[j] = barChartXValues.get(j);
    }
    screenArray[i].addBarChart(barChartValuesX, barChartValuesY, SCREENX/4, SCREENY/3, title, descriptionOfX, descriptionOfY);
  } else if (i == 6)
  {
    /*
     Added screen that displays the number of flights per day of a selected state, city or airport.
     The days are being selected choosing a start date and an end date. This can be done by writing on the two TextWidgets.
     I used methods that Cara Saulnier already made in the code above.
     Katia Neli
     */

    screenArray[i] = new Screen(i, dropdownArrayForDateRange, text);
    int indexStartDate=0;
    int indexEndDate=0;
    String title = "Number of flights per day";
    String descriptionOfX = "number of flights";

    ArrayList <Integer> barChartValues1 = new ArrayList <Integer>(0);
    ArrayList <String> barChartDescriptions1 = new ArrayList <String>(0);
    ArrayList <Integer> barChartValues2 = new ArrayList <Integer>(0);
    ArrayList <String> barChartDescriptions2 = new ArrayList <String>(0);
    ArrayList <Integer> barChartValues3 = new ArrayList <Integer>(0);
    ArrayList <String> barChartDescriptions3 = new ArrayList <String>(0);

    for (int j = 0; j < arrayDates.length; j++) {//gives the indexes for the start and end date
      if (arrayDates[j].equals(startDate))
        indexStartDate=j;
      if (arrayDates[j].equals(endDate))
        indexEndDate=j;
    }

    int sumFlightsState=0;
    for (int k = 0; k < dropdownArrayForDateRange[0].dropdownDisplay.length; k++)
    {
      if (dropdownArrayForDateRange[0].clickMenu[k] % 2==0)
      {
        for (int j = indexStartDate; j <=indexEndDate; j++) {
          barChartDescriptions1.add(arrayDates[j]);
          barChartValues1.add(dailyStateFlights[j][k]);
          sumFlightsState+=dailyStateFlights[j][k];
        }
        barChartValues1.add(sumFlightsState);
        barChartDescriptions1.add(dropdownArrayForDateRange[0].dropdownDisplay[k]);
      }
    }

    int sumFlightsCity=0;
    for (int k = 0; k < dropdownArrayForDateRange[1].dropdownDisplay.length; k++)
    {
      if (dropdownArrayForDateRange[1].clickMenu[k] % 2==0)
      {

        for (int j = indexStartDate; j <=indexEndDate; j++) {
          barChartDescriptions2.add(arrayDates[j]);
          barChartValues2.add(dailyCityFlights[j][k]);
          sumFlightsCity+=dailyCityFlights[j][k];
        }

        barChartValues2.add(sumFlightsCity);
        barChartDescriptions2.add(dropdownArrayForDateRange[1].dropdownDisplay[k]);
      }
    }

    int sumFlightsAirport=0;
    for (int k = 0; k < dropdownArrayForDateRange[2].dropdownDisplay.length; k++)
    {
      if (dropdownArrayForDateRange[2].clickMenu[k] % 2==0)
      {

        for (int j = indexStartDate; j <=indexEndDate; j++) {
          barChartDescriptions3.add(arrayDates[j]);
          barChartValues3.add(dailyAirportFlights[j][k]);
          sumFlightsAirport+=dailyAirportFlights[j][k];
        }

        barChartValues3.add(sumFlightsAirport);
        barChartDescriptions3.add(dropdownArrayForDateRange[2].dropdownDisplay[k]);
      }
    }

    float [] barChartInts1 = new float[barChartValues1.size()];
    float [] barChartInts2 = new float[barChartValues2.size()];
    float [] barChartInts3 = new float[barChartValues3.size()];
    for (int j = 0; j < barChartInts1.length; j++)
    {
      barChartInts1[j] = barChartValues1.get(j);
    }
    for (int j = 0; j < barChartInts2.length; j++)
    {
      barChartInts2[j] = barChartValues2.get(j);
    }
    for (int j = 0; j < barChartInts3.length; j++)
    {
      barChartInts3[j] = barChartValues3.get(j);
    }
    String [] barChartLabels1 = barChartDescriptions1.toArray(new String[0]);
    String [] barChartLabels2 = barChartDescriptions2.toArray(new String[0]);
    String [] barChartLabels3 = barChartDescriptions3.toArray(new String[0]);

    if (barChartLabels1.length !=0)
    {
      screenArray[i].addBarChart(barChartInts1, barChartLabels1, SCREENX/3, 150, title, "", "");
    }
    if (barChartLabels2.length !=0) {
      screenArray[i].addBarChart(barChartInts2, barChartLabels2, SCREENX/3, 300, "", "", "");
    }
    if (barChartLabels3.length !=0) {
      screenArray[i].addBarChart(barChartInts3, barChartLabels3, SCREENX/3, 450, "", descriptionOfX, "");
    }
  } else if (i == 7) {
    //Michael Moore
    screenArray[i] = new Screen(i, mapDropdown);
    screenArray[i].addButton(SCREENX/4 - DROPDOWN_WIDTH + 100, SCREENY/2-(3*DROPDOWN_HEIGHT+17), DROPDOWN_HEIGHT, DROPDOWN_WIDTH, "GO");
    screenArray[i].addMap(200, 200);
    //for the map
  } else if (i == NUMBER_OF_SCREENS -1) {
    screenArray[i] = new Screen(i);
    //for the menu
  }
}

//Michael Moore
String[] getMapString() {
  String originState = "AK";
  String destState = "AK";
  for (int k = 0; k < mapDropdown[0].dropdownDisplay.length; k++)
  {
    if (mapDropdown[0].clickMenu[k] % 2==0)
    {
      originState = states[k];
    }
  }
  for (int k = 0; k < mapDropdown[1].dropdownDisplay.length; k++)
  {
    if (mapDropdown[1].clickMenu[k] % 2==0)
    {
      destState = states[k];
    }
  }
  return new String[] {originState, destState};
}
