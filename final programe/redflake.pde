class rFlake
{
  int x, y;
  float angleRange = 0.1;
  float angle;
  int flakeSize = int(random(2, 5));
  boolean ground;

  float inc = random(3, 6);

  rFlake(int xin, int yin, float angleIn)
  {
    x = xin;
    y = yin;
    angle = angleIn;
  }

  void run()
  {
    x += inc*cos(angle);
    y += inc*sin(angle);

    angle += random(-100, 100)/10000.;

    if (y > height)
    {
      y = 0;
      x = int(random(width));
      angle = random(100)/100.*angleRange+HALF_PI-angleRange/2;
    }


    if (x>0) {
      fill(255, 0, 0,random(50,200));
      noStroke();
      ellipse(x, y, flakeSize, flakeSize);
    }
  }
}
