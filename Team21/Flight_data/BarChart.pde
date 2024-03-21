class BarChart {
  //call BarChart class when  specific button is pressed
  // put into constructor as parameters array of int and string we want to represent
  // and also the title name and description of 2 axis
  // EXAMPLE: number of flights per airport

  int [] xData;
  String [] yData;
  int position;
  PFont font, font2;
  String title, descriptionOfX, descriptionOfY;

  BarChart(int [] xData, String [] yData, String title, String descriptionOfX, String descriptionOfY) {
    this.xData=xData;
    this.yData=yData;
    this.title=title;
    this.descriptionOfX=descriptionOfX;
    this.descriptionOfY=descriptionOfY;
    font=loadFont("ArialNova-Light-16.vlw");
    font2=loadFont("ArialNova-Bold-20.vlw");
    textAlign(LEFT);
  }

  void draw() {
    //for loop draws the bar chart along with name and value for each column
    int xRect=SCREENX/4;
    int yRect;
    int hRect=20;
    int cornerRadius=8;
    for (int i = 0; i < xData.length; i++) {
      yRect=SCREENY/8+(i*25);
      float gray = map(i, 0, xData.length, 0, 255);
      fill(gray, 150, 250);
      noStroke();
      rect(xRect, yRect, xData[i], hRect, cornerRadius);
      fill(0);
      textFont(font);
      text(yData[i], 50, yRect+15);
      text(xData[i], xRect+xData[i]+10, yRect+15);
      position=i;
    }
    //draws title of chart
    textFont(font2);
    text(title, SCREENX/5, 50);
    textFont(font);
    //draws text for x-axis
    text(descriptionOfX, xRect, SCREENY/8+(position*25)+50);
    //draws vertical text for y-axis
    pushMatrix();
    translate(-(SCREENX/3)+30, SCREENY/2);
    rotate(radians(270));
    text(descriptionOfY, 0, SCREENY/2);
    popMatrix();
  }
}
