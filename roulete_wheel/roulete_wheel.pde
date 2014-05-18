float ax, ay, bx, by;
Wheel wheel;

void setup() {
  size(960, 640, P2D);
  background(255,255,255);
  smooth();
  ax = width/2;
  ay = height/2;
  bx = ax + 50;
  by = ay;
  float[] per = {0.10,0.20,0.30,0.40,0.5,0.6,0.7,0.8,0.9,1};
  wheel = new Wheel(ax,ay,bx,bx,per);
 
}

void draw() {
  fill(255,255,255);

  shape(wheel.getWheel());
  for(int i = 0; i < wheel.sections.length; i++) wheel.setText("Label", i);
  
}

void mouseDragged() {
  // code that happens when the mouse moves
  // with the button down
}

void mousePressed() {
  // code that happens when the mouse button
  // is pressed

}

void mouseReleased() {
  // code that happens when the mouse button
  // is released
}

