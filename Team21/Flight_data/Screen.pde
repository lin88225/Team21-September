class Screen{
  Button[] buttons;
  color backgroundColor = WHITE;
  
  Screen(Button[] buttons){
    this.buttons = buttons;
  }
  
  public void draw(){
    background(backgroundColor);
    for (int i = 0; i < buttons.length; i++){
      buttons[i].draw();
    }
  }
}
