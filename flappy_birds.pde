
// Declaring pipe variable
import java.util.ArrayList;
PImage flappyBird;
PGraphics pg;
int score = 0;
int lastPipePassed = -1;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
void setup() {
  size(1920,1080);

  flappyBird = loadImage("FlappyBird.png");
  imageMode(CENTER);
  frameRate(144);
  for (int i = 0; i<99; i++) {
    pipes.add(new Pipe(1500 + i * 350));
  }
}




void draw() {
  background(173, 216, 230);
  //nwPipe.x_pos-=1;
  for (Pipe ele : pipes) {
    ele.draw();
  }
  bird();
  textSize(32);
  fill(0);
  text("Score: " + score, 60, 30);
  name("S");
}


//----------------------------------------------------------------------------------------


class Pipe {
  //Rest of class
  public float y_pos; //always 0;
  public float x_pos;
  float y_posbotw = 1080;
  float y_top = random(200, 800);
  boolean collected = true;


  public Pipe(float x) {
    this.x_pos = x;
  }


  void draw() {
    x_pos-=1;
    float gapSize = -600;
    float y_bottom = gapSize + y_top;
    //top pipe
    stroke(1);
    fill(75, 174, 78);
    rect(x_pos, y_pos, 150, y_top);
    noStroke();
    fill(255, 145, 0);
    rect(x_pos+95, y_pos, 50, y_top);
    fill(255, 170, 0);
    rect(x_pos+105, y_pos, 30, y_top);
    stroke(1);
    fill(82, 138, 44);
    rect(x_pos-10, y_top-10, 170, 150);
    stroke(1);

    //bottom pipe
    fill(75, 174, 78);
    rect(x_pos, y_posbotw, 150, y_bottom);
    noStroke();
    fill(255, 145, 0);
    rect(x_pos+95, y_posbotw, 50, y_bottom);
    fill(255, 170, 0);
    rect(x_pos+105, y_posbotw, 30, y_bottom);
    stroke(1);
    fill(82, 138, 44);
    rect(x_pos-10, y_bottom + y_posbotw, 170, -150);

    //coin placement
    float coinY = y_bottom + y_posbotw - 250;
    float coinX = x_pos+75;
    if (collected) {
      Coin(coinX, coinY);
    }
    if (mouseY > coinY - 40 && mouseY < coinY + 40 && 450 > coinX - 40 && 450 < coinX + 40) {
      if (collected == true) {
        score+=1;
        collected = false;
      }
    }
  }
}

void Coin(float x, float y) {
  fill(252, 144, 3);
  circle(x, y, 80);
  fill(125, 73, 5);
  rect(x-10, y-20, 20, 40);
}

void name(String  Name) {
  fill(0, 0, 0);
  textSize(50);
  text(Name, width/1.1, 100);
}
void bird() {
  image(flappyBird, 450, mouseY);
}
