// a function to create the dropdown array
void createDropdownArray()
{
  Query q1= new Query(1, 21);
  dropdownArray = new Dropdown[9];
  String [] testData = q1.getArrayAirports();
  for (int i = 0; i < dropdownArray.length; i++)
  {
    switch(i)
    {
    case 8:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2-4*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of flights per state", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 7:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2-4*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of flights per city", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 6:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2-2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of flights per airport", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 5:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2-2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Average delay per airline", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 4:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of cancellations\nand diversions per state", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 3:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of cancellations\nand diversions per city", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 2:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2+2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Number of cancellations\nand diversions per airline", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, false);
      break;
    case 1:
      dropdownArray[i] = new Dropdown(SCREENX/2+DROPDOWN_WIDTH, SCREENY/2+2*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Average flight\ndistance per airline", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    case 0:
      dropdownArray[i] = new Dropdown(SCREENX/2-DROPDOWN_WIDTH, SCREENY/2+4*DROPDOWN_HEIGHT, DROPDOWN_WIDTH, DROPDOWN_HEIGHT,
        "Carbon emissions per airline", testData, MIMI_PINK, COLUMBIA_BLUE, DENIM, arial, true);
      break;
    default:
      System.out.println("error ");
    }
  }
}

// function to create Screens
void createScreens()
{
  Query q1= new Query(1, 21);
  Button [] tempButtonArray = new Button [10];
  int[] tempData = q1.getNumberFlightsPerAirport();
  screenArray = new Screen [6];
  for (int i = 0; i< screenArray.length; i++)
  {
    if (i ==0)
    {
      screenArray[i] = new Screen(tempButtonArray, dropdownArray);
    } else if (i == 1)
    {
      screenArray[i] = new Screen(tempButtonArray);
      ArrayList <Integer> pieChartValues1 = new ArrayList <Integer>(0);
      ArrayList <String> pieChartDescriptions1 = new ArrayList <String>(0);
      String title1 = "Number of flights per state";
      ArrayList <Integer> pieChartValues2 = new ArrayList <Integer>(0);
      ArrayList <String> pieChartDescriptions2 = new ArrayList <String>(0);
      String title2 = "Number of flights per city";
      ArrayList <Integer> pieChartValues3 = new ArrayList <Integer>(0);
      ArrayList <String> pieChartDescriptions3 = new ArrayList <String>(0);
      String title3 = "Number of flights per airport";
      for (int j = 0; j < dropdownArray[8].dropdownDisplay.length; j++)
      {
        if (dropdownArray[8].clickMenu[j] % 2==0)
        {
          pieChartValues1.add(tempData[j]);
          pieChartDescriptions1.add(dropdownArray[8].dropdownDisplay[j]);
        }
      }
      for (int j = 0; j < dropdownArray[7].dropdownDisplay.length; j++)
      {
        if (dropdownArray[7].clickMenu[j] % 2==0)
        {
          pieChartValues2.add(tempData[j]);
          pieChartDescriptions2.add(dropdownArray[7].dropdownDisplay[j]);
        }
      }
      for (int j = 0; j < dropdownArray[6].dropdownDisplay.length; j++)
      {
        if (dropdownArray[6].clickMenu[j] % 2==0)
        {
          pieChartValues3.add(tempData[j]);
          pieChartDescriptions3.add(dropdownArray[6].dropdownDisplay[j]);
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
      screenArray[i].addPieChart(pieChartInts1, pieChartLabels1, title1);
      screenArray[i].addPieChart(pieChartInts2, pieChartLabels2, title2);
      screenArray[i].addPieChart(pieChartInts3, pieChartLabels3, title3);
    } else if (i == 2)
    {
      screenArray[i] = new Screen(tempButtonArray);
      ArrayList <Integer> barChartXValues = new ArrayList <Integer>(0);
      ArrayList <String> barChartYValues = new ArrayList <String>(0);
      String title = "Average delay per airline";
      String descriptionOfX = "Average delay (minutes)";
      String descriptionOfY = "Airlines";
      for (int j = 0; j < dropdownArray[5].dropdownDisplay.length; j++)
      {
        if (dropdownArray[5].clickMenu[j] % 2 ==0)
        {
          barChartXValues.add(tempData[j]);
          barChartYValues.add(dropdownArray[5].dropdownDisplay[j]);
        }
      }
      String [] barChartValuesY = barChartYValues.toArray(new String[0]);
      int [] barChartValuesX = new int [barChartXValues.size()];
      for (int j = 0; j < barChartValuesX.length; j++)
      {
        barChartValuesX[j] = barChartXValues.get(j);
      }
      screenArray[i].addBarChart(barChartValuesX, barChartValuesY, title, descriptionOfX, descriptionOfY);
    } else if (i ==3)
    {
      screenArray[i] = new Screen(tempButtonArray);
      ArrayList <Integer> barChartValues1 = new ArrayList <Integer>(0);
      ArrayList <String> barChartDescriptions1 = new ArrayList <String>(0);
      String title1 = "Number of cancelled and diverted flights per state";
      ArrayList <Integer> barChartValues2 = new ArrayList <Integer>(0);
      ArrayList <String> barChartDescriptions2 = new ArrayList <String>(0);
      String title2 = "Number of cancelled and diverted flights per city";
      ArrayList <Integer> barChartValues3 = new ArrayList <Integer>(0);
      ArrayList <String> barChartDescriptions3 = new ArrayList <String>(0);
      String title3 = "Number of cancelled and diverted flights per airport";
      for (int j = 0; j < dropdownArray[4].dropdownDisplay.length; j++)
      {
        if (dropdownArray[4].clickMenu[j] % 2==0)
        {
          barChartValues1.add(tempData[j]);
          barChartDescriptions1.add(dropdownArray[4].dropdownDisplay[j]);
        }
      }
      for (int j = 0; j < dropdownArray[3].dropdownDisplay.length; j++)
      {
        if (dropdownArray[3].clickMenu[j] % 2==0)
        {
          barChartValues2.add(tempData[j]);
          barChartDescriptions2.add(dropdownArray[3].dropdownDisplay[j]);
        }
      }
      for (int j = 0; j < dropdownArray[2].dropdownDisplay.length; j++)
      {
        if (dropdownArray[2].clickMenu[j] % 2==0)
        {
          barChartValues3.add(tempData[j]);
          barChartDescriptions3.add(dropdownArray[2].dropdownDisplay[j]);
        }
      }
      int [] barChartInts1 = new int[barChartValues1.size()];
      int [] barChartInts2 = new int[barChartValues2.size()];
      int [] barChartInts3 = new int[barChartValues3.size()];
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
        screenArray[i].addBarChart(barChartInts1, barChartLabels1, title1, "Number of flights on time, cancelled, and diverted", barChartLabels1[i]);
      }
      if (barChartLabels2.length !=0) {
        screenArray[i].addBarChart(barChartInts2, barChartLabels2, title2, "Number of flights on time, cancelled, and diverted", barChartLabels2[i]);
      }
      if (barChartLabels3.length !=0) {
        screenArray[i].addBarChart(barChartInts3, barChartLabels3, title3, "Number of flights on time, cancelled, and diverted", barChartLabels3[i]);
      }
    } else if (i ==4)
    {
      screenArray[i] = new Screen(tempButtonArray);
      ArrayList <Integer> barChartXValues = new ArrayList <Integer>(0);
      ArrayList <String> barChartYValues = new ArrayList <String>(0);
      String title = "Average distance per airline";
      String descriptionOfX = "Average distance (km)";
      String descriptionOfY = "Airlines";
      for (int j = 0; j < dropdownArray[1].dropdownDisplay.length; j++)
      {
        if (dropdownArray[1].clickMenu[j] % 2 ==0)
        {
          barChartXValues.add(tempData[j]);
          barChartYValues.add(dropdownArray[1].dropdownDisplay[j]);
        }
      }
      String [] barChartValuesY = barChartYValues.toArray(new String[0]);
      int [] barChartValuesX = new int [barChartXValues.size()];
      for (int j = 0; j < barChartValuesX.length; j++)
      {
        barChartValuesX[j] = barChartXValues.get(j);
      }
      screenArray[i].addBarChart(barChartValuesX, barChartValuesY, title, descriptionOfX, descriptionOfY);
    } else if (i == 5)
    {
      screenArray[i] = new Screen(tempButtonArray);
      ArrayList <Integer> barChartXValues = new ArrayList <Integer>(0);
      ArrayList <String> barChartYValues = new ArrayList <String>(0);
      String title = "Total carbon emissions per airline";
      String descriptionOfX = "Total emissions (insert unit here)";
      String descriptionOfY = "Airlines";
      for (int j = 0; j < dropdownArray[0].dropdownDisplay.length; j++)
      {
        if (dropdownArray[0].clickMenu[j] % 2 ==0)
        {
          barChartXValues.add(tempData[j]);
          barChartYValues.add(dropdownArray[0].dropdownDisplay[j]);
        }
      }
      String [] barChartValuesY = barChartYValues.toArray(new String[0]);
      int [] barChartValuesX = new int [barChartXValues.size()];
      for (int j = 0; j < barChartValuesX.length; j++)
      {
        barChartValuesX[j] = barChartXValues.get(j);
      }
      screenArray[i].addBarChart(barChartValuesX, barChartValuesY, title, descriptionOfX, descriptionOfY);
    }
  }
}
