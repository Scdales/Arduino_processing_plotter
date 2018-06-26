import grafica.*;
import processing.serial.*;

public int SERIAL_SPEED = 19200;
int counter = 0;

public GPlot plot;
Serial myPort;


public void Draw() {
  plot = new GPlot(this);
  plot.setPos(10, 10);
  plot.setDim(680, 480);
  plot.getTitle().setText("Arduino Data");
  plot.getXAxis().getAxisLabel().setText("X");
  plot.getYAxis().getAxisLabel().setText("Y");
  plot.activateZooming(2, CENTER, CENTER);
  plot.activatePanning();
}

public void setup() {
  size(800, 600);
  
  //println(Serial.list());
  
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 19200);
  
  Draw();
}

public void draw() {
  
  
  //Press space bar to clear the plot
  if (keyPressed && key == ' ') {
    plot.setPoints(new GPointsArray());
    counter = 0;
    Draw();
  }
  
  if (myPort.available() > 0) {
    plot.addPoint(counter, myPort.read());
    counter++;
  }
  
  // Draw the plot
  plot.beginDraw();
  plot.drawBackground();
  plot.drawBox();
  plot.drawXAxis();
  plot.drawYAxis();
  plot.drawTitle();
  plot.drawGridLines(GPlot.BOTH);
  plot.drawLines();
  plot.drawPoints();
  plot.endDraw();
}
