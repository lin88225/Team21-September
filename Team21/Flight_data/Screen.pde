private static int numberOfScreens = 0;
private static int currentScreenShown = 0;

class Screen{
  ArrayList<PieChart> pieCharts = new ArrayList<>();
  ArrayList<BarChart> barCharts = new ArrayList<>();
  ArrayList<Dropdown> dropdowns = new ArrayList<>();
  ArrayList<Button> buttons = new ArrayList<>();
  color backgroundColor = MIMI_PINK;

  int screenID;
  Button nextScreen;
  Button previuosScreen;
  
  
  Screen(){
    screenID = numberOfScreens;
    numberOfScreens += 1;
    nextScreen = new Button(SCREENX - 100, 50, 50, 100, "Next");
    previuosScreen = new Button(100, 50, 50, 100, "Back");
  }
  
  
  public void draw(){
    background(backgroundColor);
    Button button;
    Dropdown dropdown;
    PieChart pieChart;
    BarChart barChart;
    for (int i = 0; i < buttons.size(); i++)
    {
      button = buttons.get(i);
      button.draw();
    }
    for (int i = 0; i < dropdowns.size(); i++)
    {
      dropdown = dropdowns.get(i);
      dropdown.draw();
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
    if(screenID != 0){
        previuosScreen.draw();
    }
    if(screenID != numberOfScreens - 1){
        nextScreen.draw();
    }
  }
  
  public int checkButtonsPressed(){
    if(nextScreen.isMouseOver()){
      if(currentScreenShown != numberOfScreens - 1){
        currentScreenShown += 1;
    }
    }if(previuosScreen.isMouseOver()){
      if(currentScreenShown !=0){
        currentScreenShown -= 1;
    }
    }
    
    
    final int NO_BUTTON_PRESSED = -1;
    for (int i = 0; i < buttons.size(); i++)
      {
        if(buttons.get(i).isMouseOver())
        {
          return buttons.get(i).getID();
        }
      }
      return NO_BUTTON_PRESSED;
  }
  public void addPieChart(int [] values, String [] description, String title){
    PieChart pieChart = new PieChart(values, description, title);
    pieCharts.add(pieChart);
  }
  public void removePieChart(int index){
    pieCharts.remove(index);
  }
  public PieChart getPieChart(int index){
    return pieCharts.remove(index);
  }
  
  public void addBarChart(float [] xData, String [] yData, String title, String descriptionOfX, String descriptionOfY){
    BarChart barcharts = new BarChart(xData, yData, title, descriptionOfX, descriptionOfY);
    barCharts.add(barcharts);
  }
  public void removeBarChart(int index){
    barCharts.remove(index);
  }
  public BarChart getBarChart(int index){
    return barCharts.get(index);
  }
  
  public void addDropdown(int x, int y, int width, int height, String dropdownTitle, String [] dropdownDisplay, color titleColour, color menuColour, color clickColour, PFont dropdownFont, boolean multipleSelection){
    Dropdown dropdown = new Dropdown(x, y, width, height, dropdownTitle, dropdownDisplay, titleColour, menuColour, clickColour, dropdownFont, multipleSelection);
    dropdowns.add(dropdown);
  }
  public void removeDropdown(int index){
    dropdowns.remove(index);
  }
  public Dropdown getDropdown(int index){
    return dropdowns.get(index);
  }
  
  public void addButton(float xpos, float ypos, float height, float width, String text){
    Button button = new Button( xpos,  ypos,  height,  width,  text);
    buttons.add(button);
  }
  public void removeButton(int index){
    buttons.remove(index);
  }
  public Button getButton(int index){
    return buttons.get(index);
  }
}
