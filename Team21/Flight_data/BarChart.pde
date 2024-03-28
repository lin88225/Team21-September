/*class BarChart {
 //call BarChart class when  specific button is pressed
 // put into constructor as parameters array of int and string we want to represent
 // and also the title name and description of 2 axis
 // EXAMPLE: number of flights per airport
 
 float [] xData;
 String [] yData;
 int position;
 PFont font, font2;
 String title, descriptionOfX, descriptionOfY;
 
 BarChart(float [] xData, String [] yData, String title, String descriptionOfX, String descriptionOfY) {
 this.xData=xData;
 this.yData=yData;
 this.title=title;
 this.descriptionOfX=descriptionOfX;
 this.descriptionOfY=descriptionOfY;
 font=loadFont("ArialNova-Light-16.vlw");
 font2=loadFont("ArialNova-Bold-20.vlw");
 //textAlign(LEFT);
 }
 
 void draw() {
 //for loop draws the bar chart along with name and value for each column
 textAlign(LEFT);
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
 }*/

class BarChart {
  //call BarChart class when  specific button is pressed
  // put into constructor as parameters array of int and string we want to represent
  // and also the title name and description of 2 axis
  // EXAMPLE: number of flights per airport

  float [] xData;
  String [] yData;
  int x;
  int y;
  int position;
  PFont font, font2;
  String title, descriptionOfX, descriptionOfY;
  float biggestDataPoint;

  BarChart(float [] xData, String [] yData, int x, int y, String title, String descriptionOfX, String descriptionOfY) {
    this.xData=xData;
    this.yData=yData;
    this.x=x;
    this.y=y;
    this.title=title;
    this.descriptionOfX=descriptionOfX;
    this.descriptionOfY=descriptionOfY;
    font=loadFont("ArialNova-Light-16.vlw");
    font2=loadFont("ArialNova-Bold-20.vlw");
    if (xData != null && xData.length>0) {
      biggestDataPoint = this.xData[0];
    
    for (int i =1; i< xData.length; i++)
    {
      if (xData[i]>xData[i-1])
      {
        biggestDataPoint = xData[i];
      }
    }
    }
    //textAlign(LEFT);
  }

  void draw() {
    //for loop draws the bar chart along with name and value for each column
    textAlign(LEFT);
    //int xRect=SCREENX/4;
    int yRect;
    int hRect=20;
    int cornerRadius=8;
    for (int i = 0; i < xData.length; i++) {
      yRect=y+(i*25);
      float gray = map(i, 0, xData.length, 0, 255);
      fill(gray, 150, 250);
      noStroke();
      rect(x, yRect, xData[i]/biggestDataPoint*150, hRect, cornerRadius);
      fill(0);
      textFont(font);
      text(yData[i], 50, yRect+15);
      text(xData[i], x+xData[i]+10, yRect+15);
      position=i;
    }
    //draws title of chart
    textFont(font2);
    text(title, x, y-20);
    textFont(font);
    //draws text for x-axis
    text(descriptionOfX, x, y+(position*25)+(y-20));
    //draws vertical text for y-axis (need to fix this)
    pushMatrix();
    translate(-(SCREENX/3)+30, SCREENY/2);
    rotate(radians(270));
    text(descriptionOfY, 0, SCREENY/2);
    popMatrix();
    textAlign(CENTER);
  }
  
}
