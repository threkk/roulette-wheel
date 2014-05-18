class Section {
  float[] points; // center and first point
  float percentage; // percentage of the wheel
  PShape section;
  
  private final float INCR = 0.0005; 

  public Section(float centerx, float centery, float firstpx, float firstpy, float percentage) {
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
  
  public PShape getPShape(Colour colour, Colour stroke, int weight) {
    if (section == null) {      
      section = createShape();
      section.beginShape();
      section.stroke(stroke.r, stroke.g, stroke.b);
      section.strokeWeight(weight);
      section.fill(colour.r, colour.g, colour.b);
      section.vertex(points[0],points[1]);

      for(float i = 0.0; i < percentage; i += INCR) {
        float[] p = calculateVertex(i);
        section.vertex(p[0],p[1]);
      }
      
      section.endShape(CLOSE);
    }
    return section;
  }
  
  public PShape getPShape(int cr, int cg, int cb, int sr, int sg, int sb, int weight) {
    Colour colour = new Colour(cr, cg, cb);
    Colour stroke = new Colour(sr, sg, sb);
    return getPShape(colour, stroke, weight);
  }
  
  public float[] getFinalPoint() {
    float[] finalPoint = calculateVertex(percentage);
    return finalPoint; 
 }
 
 public float[] getMidPoint() {
    float[] finalPoint = calculateVertex(percentage/2);
    return finalPoint; 
 }
}

class Wheel {
  
  private float[] percentages;
  public Section[] sections;
  private PShape wheel;
  private float centerx, centery, lastx, lasty;
  
  public Wheel(float centerx, float centery, float firstpx, float firstpy, float[] percentages) {
    
   this.percentages = new float[percentages.length];
   this.sections = new Section[percentages.length];
    
   this.centerx = centerx;
   this.centery = centery;
   this.lastx = firstpx;
   this.lasty = firstpy;
    
   // Normalise
   float sum = 0;
   for(int i = 0; i < percentages.length; i++) sum += percentages[i];
   for(int i = 0; i < percentages.length; i++) {
     this.percentages[i] = percentages[i]/sum;
     
     // Initialise
     this.sections[i] = new Section(centerx, centery, lastx, lasty, this.percentages[i]);
     this.lastx = sections[i].getFinalPoint()[0];
     this.lasty = sections[i].getFinalPoint()[1];
   } 
  }
  
  // Give the option to change the colour per section.
  public PShape getWheel() {
    if(wheel == null) {
      wheel = createShape(GROUP);
      for(int i = 0; i < sections.length; i++) wheel.addChild(sections[i].getPShape(Colour.ALL[i % Colour.ALL.length], Colour.BLACK, 2));
    }
    return wheel;
  }

  // Give options to change the text size, colour and position.
  public void setText(String text, int i) {
    fill(0);
    textSize(24);
    text("Label", sections[i].getMidPoint()[0],sections[i].getMidPoint()[1]);
  }
}
