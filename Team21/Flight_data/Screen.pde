private static int numberOfScreens = 0;


class Screen{
  Button[] buttons;
  Dropdown[] dropdowns;
  ArrayList<PieChart> pieCharts = new ArrayList<>();
  ArrayList<BarChart> barCharts = new ArrayList<>();
  color backgroundColor = MIMI_PINK;
  int screenID;
  
  
  Screen(Button[] buttons, Dropdown[] dropdowns){
    this(buttons);
    this.dropdowns = dropdowns;
  }
  Screen(Button[] buttons){
    this.buttons = buttons;
    dropdowns = new Dropdown[] {};
  }
  
  
  public void draw(){
    background(backgroundColor);
    PieChart pieChart;
    BarChart barChart;
    for (int i = 0; i < buttons.length; i++)
    {
      buttons[i].draw();
    }
    for (int i = 0; i < dropdowns.length; i++)
    {
      dropdowns[i].draw();
    }
    for (int i = 0; i < pieCharts.size(); i++)
    {
      pieChart = pieCharts.get(i);
      pieChart.draw();
    }
    for (int i = 0; i < barCharts.size(); i++)
    {
      barChart = barCharts.get(i);
      barChart.draw();
    }
  }
  
  public int checkButtonsPressed(){
    final int NO_BUTTON_PRESSED = -1;
    for (int i = 0; i < buttons.length; i++)
      {
        if(buttons[i].isMouseOver())
        {
          return buttons[i].getID();
        }
      }
      return NO_BUTTON_PRESSED;
  }
  public void addPieChart(int [] values, String [] description, String title){
    PieChart pieChart = new PieChart(values, description, title);
    pieCharts.add(pieChart);
  }
  public void addBarChart(int [] xData, String [] yData, String title, String descriptionOfX, String descriptionOfY){
    BarChart barcharts = new BarChart(xData, yData, title, descriptionOfX, descriptionOfY);
    barCharts.add(barcharts);
  }
}


/*
In the main program you want to put all your screens into an array, and make a global variable to keep track of what screen your on

Under the mousePressed function make a switch statement that has the funtion of each button
EX of how to setup:



Button button1 = new Button(50, 50, 50, 100, "switch");
Button button2 = new Button(50, 300, 50, 100, "test1");
Button[] buttons1 = new Button[]{button1, button2};
screen1 = new Screen(buttons1);
Button button3= new Button(300, 50, 50, 100, "switch");
Button button4 = new Button(300, 300, 50, 100, "test2");
Button[] buttons2 = new Button[]{button3, button4};
screen2 = new Screen(buttons2);
  
screens = new Screen[] {screen1, screen2};
int currentScreen = 0;
void mousePressed(){
  int event = screens[currentScreen].checkButtonsPressed(); the event will equal the button id
  switch (event) {
    case 0:
      currentScreen += 1;
      break;
    case 1:
      print("test1");
      break;
    case 2:
      currentScreen -= 1;
      break;
    case 3:
      print("test2");
      break;
  }

*/
