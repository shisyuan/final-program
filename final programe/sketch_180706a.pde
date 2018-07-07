
import processing.serial.*;
import ddf.minim.*; 
Minim minim; 
AudioPlayer player; 
AudioPlayer player1;

PFont myFont;
int b=0;
int b1;
int r=0;
int x =330;
int y = 340;
int w =140;
int h = 40;
boolean flag= false;
PImage img1;
PImage img2;
PImage img3;
Serial number;
int numFlakes = 700;
rFlake[] rflakes = new rFlake[numFlakes];
Flake[] flakes = new Flake[numFlakes];
float angleRange = 0.1;


void setup() {
  String COM3 = Serial.list()[0];
  number = new Serial(this, COM3, 9600);
  minim = new Minim(this); 
  player = minim.loadFile("Monody1.mp3");
  player1 = minim.loadFile("click.mp3");

  size(800, 600);
  myFont = createFont("pixelyourlife", 50);
  textFont(myFont);
  img1 = loadImage("timg0J298T2W.jpg");
  img2 = loadImage("blue.jpg");
  img3 = loadImage("red.jpg");
  frameRate(24);
  smooth();
  for (int i = 0; i < numFlakes; i++)
  {
    int cX = int(random(width));
    int cY = int(random(height));
    float angle = random(100)/100.*angleRange+HALF_PI-angleRange/2;

    rflakes[i] = new rFlake(cX, cY, angle);
  }

  for (int i = 0; i < numFlakes; i++)
  {
    int cX = int(random(width));
    int cY = int(random(height));
    float angle = random(100)/100.*angleRange+HALF_PI-angleRange/2;

    flakes[i] = new Flake(cX, cY, angle);
  }
}

void mousePressed() {
  flag=true;
}

void draw() {
    player.play(); 
  image(img1, -100, -100);

  fill(0);
  ellipse(230, 370, 40, 40);
  fill(100, 180, 255);
  noStroke();
  ellipse(220, 360, 40, 40);
  fill(0);
  ellipse(590, 370, 40, 40);
  fill(255, 120, 180);
  noStroke();
  ellipse(580, 360, 40, 40);

  fill(0);
  textSize(100);
  text("BE QUICKER", 140, 310);

  fill(255);
  textSize(100);
  text("BE QUICKER", 130, 300);

  fill(0);
  rect(x-40, y+10, w+100, h);

  fill(255);
  rect(x-50, y, w+100, h);
  fill(0);
  textSize(30);
  text("click to start", 300, 370);
  if (flag==true) {
    player1.play();
    image(img1, -100, -100);
    fill(100, 180, 255);
    textSize(30);
    text("player 1"+" "+":", 150, 50);
    fill(255, 120, 180);
    textSize(30);
    text("player 2"+" "+":", 480, 50);
    fill(255);
    textSize(30);
    text(b, 300, 50);
    fill(255);
    text(r, 630, 50);
    fill(255);

    stroke(255);
    line(100, 152, 370, 152);

    stroke(255);
    line(430, 152, 700, 152);

    fill(100, 180, 255, 200);
    noStroke();
    rect(100, 500-12*(b-1), 270, 12*b);

    fill(255, 120, 180, 200);
    noStroke();
    rect(430, 500-12*(r-1), 270, 12*r);

    if (number.available() > 0) {
      player1.play();
      char m = number.readChar();
      println(m);
      switch(m) {
      case'1':
        b++;
        
      }

      switch(m) {
      case'2':
        r++;
       
      }
    }


    //rect(100,500-12*b1,270,10);








    if (b>=30) {
      image(img2, 0, 0);
      r=-1000;
      fill(255, 200);
      noStroke();
      rect(160, 220, 470, 180);
      textSize(60);
      fill(0);
      text("PLAYER 1 WINS", 184, 304);
      textSize(60);
      fill(0, 0, 255);
      text("PLAYER 1 WINS", 180, 300);

      for (int i=0; i<numFlakes; i++)
      {
        flakes[i].run();
      }

      fill(255);
      rect(x, y, w, h);
      fill(0);
      textSize(30);
      text("restart", 350, 370);
      if ((mouseX > x)&&(mouseY < x+w)&&(mouseY>y)&&(mouseY < y+h)) {
          player1.play();
        fill(0);
        rect(x, y, w, h);
        fill(255);
        textSize(30);
        text("restart", 350, 370);

        if (mousePressed==true) {
         
          restart();
        }
      }
    }


    if (r>=30) {
      image(img3, 0, 0);
      b=-1000;
      fill(255, 200);
      noStroke();
      rect(160, 220, 470, 180);
      textSize(60);
      fill(0);
      text("PLAYER 2 WINS", 184, 304);
      textSize(60);
      fill(255, 0, 0);
      text("PLAYER 2 WINS", 180, 300);

      for (int i=0; i<numFlakes; i++)
      {
        rflakes[i].run();
      }

      fill(255);
      rect(x, y, w, h);
      fill(0);
      textSize(30);
      text("restart", 350, 370);
      if ((mouseX > x)&&(mouseY < x+w)&&(mouseY>y)&&(mouseY < y+h)) {
          player1.play();
        fill(0);
        rect(x, y, w, h);
        fill(255);
        textSize(30);
        text("restart", 350, 370);
        if (mousePressed==true) {
        
          restart();
          
        }
      }
    }
  }
}




void restart() {
  b=0;
  r=0;
  background(0);

  //rect(x, y, w, h);
  //fill(0);
  //textSize(30);
  //text("start", 350, 370);

  //if ((mouseX > x)&&(mouseY < x+w)&&(mouseY>y)&&(mouseY < y+h)) {
  // fill(0);
  // rect(x, y, w, h);
  // fill(255);
  // textSize(30);
  // text("start", 350, 370);
  // if (flag==true) {

  //}
  // }
}
