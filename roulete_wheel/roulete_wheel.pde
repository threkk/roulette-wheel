float ax, ay, bx, by, cx, cy;
Section s1,s2;
void setup() {
  size(960, 640, P2D);
  background(255,255,255);
  ax = width/2;
  ay = height/2;
  bx = ax + 100;
  by = ay;
  s1 = new Section(ax,ay,bx,by,0.25);
  s2 = new Section(ax,ay,s1.getFinalPoint()[0],s1.getFinalPoint()[1],0.25);
}

void draw() {
  fill(255,255,255);

  PShape section1 = s1.getPShape(0, Colour.LIGHT_RED);
  PShape section2 = s2.getPShape(0, 255,255,0);
  shape(section1);
  shape(section2);
  
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

