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
  /*ellipse(ax, ay, 200,200);

  
  cx = (bx - ax) * cos(TWO_PI * 0.25) - (by - ay) * sin(TWO_PI * 0.25) + ax;
  cy = (bx - ax) * sin(TWO_PI * 0.25) + (by - ay) * cos(TWO_PI * 0.25) + ay;
  stroke(255,0,0);
  line(ax,ay,bx,by);
  line(ax,ay,cx,cy);
  fill(255,255,255);*/
  PShape section1 = s1.getPShape(0,100);
  PShape section2 = s2.getPShape(0,200);
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

