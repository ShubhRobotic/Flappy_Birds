
// Declaring pipe variable
import java.util.ArrayList;
PImage bg, flappyBird;
PGraphics pg;
int score = 0;
int lastPipePassed = -1;
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
void setup() {
  // Loading BackGround Image
  size(1920, 1080);
  bg = loadImage("flappy-bird.png");
  flappyBird = loadImage("FlappyBird.png");
  imageMode(CENTER);
  frameRate(120);
  for(int i = 0; i<99; i++){
    pipes.add(new Pipe(1500 + i * 300));
 
  }
  }




void draw() {
  background(bg);
  //nwPipe.x_pos-=1;
  for(Pipe ele : pipes){
    ele.draw();
  }
  bird();
  
  
      // The I goes from 0 to 9999; 
    for (int i = 0; i < pipes.size(); i++) {  
      Pipe ele = pipes.get(i); // gets each pip and store it in ele
    if (i > lastPipePassed && birdPassedPipe(ele)) { // if I greater than lastPipePassed which is -1 and each pipe counted
      score+=1; // Increase the score
      lastPipePassed = i; // Update the index of the last passed pipe
    }
    
  }
  textSize(32);
  fill(0);
  text("Score: " + score, 60, 30);
  name("S");
  
  
  
}


//----------------------------------------------------------------------------------------


class Pipe {
  //Rest of class
  public float y_pos;
  public float x_pos;
  float y_posbotw = 1080;
  float y_top = random(150, 1000);


  public Pipe(float x) {
    this.x_pos = x;
  }

  void draw() {
    x_pos-=1;
    float gapSize = -900;
    float y_bottom = gapSize + y_top;
   // float startingPoint = 1930;
   // float end = -150;
   /* if (x_pos < end) {
      x_pos =  startingPoint;
      y_top = random(150, 900);
      y_bottom = gapSize +y_top;
  }
  */ 
    fill(75, 174, 78);
    rect(x_pos, y_pos, 150, y_top);
    rect(x_pos, y_posbotw, 150, y_bottom);
   
  }
  
}
boolean birdPassedPipe(Pipe pipe) {
  return pipe.x_pos + 75 < 450 - flappyBird.width / 2;
}
void name(String  Name){
  fill(0,0,0);
  textSize(50);
  text(Name,1350,100);
}
void bird() {
  image(flappyBird, 450, mouseY);
  
}
