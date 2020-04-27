ArrayList<Agent> agents = new ArrayList<Agent>();
float scale = 2000;
float EPSILON = 0.01;
float zoff = 0;

void setup(){
  fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  for(int i = 0; i < 10000; i++){
    agents.add(new Agent());
  }
  background(360);
}

void mousePressed(){
  background(360);
  for(Agent agent : agents){
    agent.reset();
  }
  zoff = random(100);
}

void draw(){
  noStroke();
  //fill(255, 10);
  //rect(0, 0, width, height);
  //fill(0, 5);
  for(Agent agent : agents){
    agent.update();
  }
}

class Agent{
  PVector pos = new PVector();
  
  Agent(){
    pos = new PVector(random(width), random(height));
  }
  
  void reset(){
    pos = new PVector(random(width), random(height));
  }
  
  PVector gradient(PVector p){
    float x = (noise(p.x+EPSILON, p.y, zoff)-noise(p.x-EPSILON, p.y, zoff))/(2*EPSILON);
    float y = (noise(p.x, p.y+EPSILON, zoff)-noise(p.x, p.y-EPSILON, zoff))/(2*EPSILON);
    return new PVector(x, y);
  }
  
  void update(){
    PVector grad = gradient(new PVector(pos.x/scale, pos.y/scale));
    pos.add(grad.copy().normalize().mult(1));
    if(grad.mag() < 0.0001){
      pos = new PVector(random(width), random(height));
    }
    fill(grad.mag()*36+200, 100, 100, 10);
    ellipse(pos.x, pos.y, 2, 2);
  }
}