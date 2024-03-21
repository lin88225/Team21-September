class PieChart {
  //call PieChart class when  specific button is pressed
  // put into constructor as parameters array of int and string we want to represent
  // and also the title

  int[] values;
  String [] description;
  String title;
  PFont font, font2;

  PieChart(int [] values, String [] description, String title) {
    this.values=values;
    this.description=description;
    this.title=title;
    font=loadFont("ArialNova-Light-16.vlw");
    font2=loadFont("ArialNova-Bold-20.vlw");
  }

  void draw() {
    pieChart(400, values);
    legend(values);
    textFont(font2);
    text(title, SCREENX/5, 50);
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
      arc(SCREENX/3, SCREENY/2, diameter, diameter, lastAngle, lastAngle+(radians(data[i])/sum(data)*360));
      lastAngle += (radians(data[i])/sum(data)*360);
    }
  }

  void legend(int [] data) {
    int xRect=SCREENX-300;
    int yRect;
    int squareSide=10;
    for (int i = 0; i < data.length; i++) {
      yRect= 80+(i*15);
      float gray = map(i, 0, data.length, 0, 255);
      fill(255, gray, 100);
      rect(xRect, yRect, squareSide, squareSide);
      textFont(font);
      fill(0);
      text(description[i], xRect+20, yRect+10);
    }
  }
}
