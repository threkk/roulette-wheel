class Section {
  float[] points; // center and first point
  float percentage; // percentage of the wheel
  PShape section;
  
  private final float INCR = 0.0005; 
  
  Section(float centerx, float centery, float firstpx, float firstpy, float percentage) {
    points = new float[4];
    points[0] = centerx;
    points[1] = centery;
    points[2] = firstpx;
    points[3] = firstpy;
    
    this.percentage = percentage;
  }
  
  private float[] calculateVertex(float p) {
    float[] point = new float[2];
    point[0] = (points[2] - points[0]) * cos(TWO_PI * p) - (points[3] - points[1]) * sin(TWO_PI * p) + points[0];
    point[1] = (points[2] - points[0]) * sin(TWO_PI * p) + (points[3] - points[1]) * cos(TWO_PI * p) + points[1];
    return point;
  }
  
  public PShape getPShape(int stroke, int r, int g, int b) {
    if (section == null) {      
      section = createShape();
      section.beginShape();
      section.stroke(stroke);
      section.fill(colour);
      section.vertex(points[0],points[1]);

      for(float i = 0.0; i < percentage; i += INCR) {
        float[] p = calculateVertex(i);
        section.vertex(p[0],p[1]);
      }
      
      section.endShape(CLOSE);
      
      return section;
    } else {
      return section;
    }
  }
  
  public float[] getFinalPoint() {
    float[] finalPoint = calculateVertex(percentage);
    return finalPoint; 
 }
}
