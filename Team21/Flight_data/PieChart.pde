/**
 This class creates a pie chart based on the data provided.
 Put into constructor as parameters array of int and string we want to represent and also the title.
 Katia Neli
 */
class PieChart {

  int[] values;
  String [] description;
  String title;
  PFont font, font2;
  int diameter;
  int x;
  int y;

  PieChart(int [] values, int diameter, int x, int y, String [] description, String title) {
    this.values=values;
    this.diameter=diameter;
    this.x=x;
    this.y=y;
    this.description=description;
    this.title=title;
    font=loadFont("ArialNova-Light-16.vlw");
    font2=loadFont("ArialNova-Bold-20.vlw");
  }

  void draw() {
    pieChart(diameter, values);
    legend(values);
    textFont(font2);
    text(title, x-(diameter/2+20), y-(diameter/2+20));
  }

  int sum(int []data) {
    int sum=0;
    for (int i = 0; i < data.length; i++) {
      sum+=data[i];
    }
    return sum;
  }

  void pieChart(float diameter, int[] data) {
    float lastAngle = 0;
    for (int i = 0; i < data.length; i++) {
      float gray = map(i, 0, data.length, 0, 255);
      fill(255, gray, 100);
      arc(x, y, diameter, diameter, lastAngle, lastAngle+(radians(data[i])/sum(data)*360));
      lastAngle += (radians(data[i])/sum(data)*360);
    }
  }

  void legend(int [] data) {
    int xRect=x+diameter/2+20;
    int yRect;
    int squareSide=10;
    for (int i = 0; i < data.length; i++) {
      yRect= y-(diameter/2-20)+(i*15);
      float gray = map(i, 0, data.length, 0, 255);
      fill(255, gray, 100);
      rect(xRect, yRect, squareSide, squareSide);
      textFont(font);
      fill(0);
      textAlign(LEFT);
      text(description[i], xRect+15, yRect+5);
    }
  }
}
