class Colour {
  
  public static final Colour WHITE = new Colour(255,255,255);
  public static final Colour BLACK = new Colour(0,0,0);
  public static final Colour LIGHT_BLUE = new Colour(33,181,229);
  public static final Colour DARK_BLUE = new Colour(0,153,204);
  public static final Colour LIGHT_PURPLE = new Colour(170,102,204);
  public static final Colour DARK_PURPLE = new Colour(153,51,204);  
  public static final Colour LIGHT_GREEN = new Colour(153,204,0);
  public static final Colour DARK_GREEN = new Colour(102,153,0);
  public static final Colour LIGHT_ORANGE = new Colour(255,187,51);
  public static final Colour DARK_ORANGE = new Colour(255,136,0);
  public static final Colour LIGHT_RED = new Colour(255,68,68);
  public static final Colour DARK_RED = new Colour(204,0,0);
  
  public final int r, g, b;
  
  public Colour(int r, int g, int b) {
    this.r = r;
    this.g = g;
    this.b = b;
  }
}
