ArrayList<Agent> agents = new ArrayList<Agent>();
float noiseScale=1000;
float zoff;

void setup(){
  colorMode(HSB, 360, 100, 100, 100);
  fullScreen();
  background(360);
  for(int i = 0; i < 10000; i++){
    Agent agent = new Agent();
    agent.x = random(0, width);
    agent.y = random(0, height);
    agent.zoff = zoff;
    agent.speed = random(9, 11);
    agent.col=color(0, 100, 100, 100);
    agents.add(agent);
  }
}

void draw(){
  loadPixels();
  zoff+=0.001;
  //background(255);
  fill(360, 1);
  //rect(0, 0, width, height);
  ArrayList<Agent> Nagents = new ArrayList<Agent>();
  for(Agent agent:agents){
    fill(agent.col);
    noStroke();
    rect(agent.x, agent.y, 1, 1);
    Agent Nagent = new Agent();
    float angle = map(noise(agent.x/noiseScale, agent.y/noiseScale, zoff), 0, 1, -PI, PI);
    if(agent.x < 0 || agent.x > width || agent.y < 0 || agent.y > height){
          agent.x = lerp(agent.x, width/2, 0.01);
          agent.y = lerp(agent.y, height/2, 0.01);
          agent.speed = -agent.speed;
          //agent.x = width/2;
          //agent.y = height/2;
    }
    Nagent.x = agent.x + cos(angle*2*PI)*agent.speed;
    Nagent.y = agent.y + sin(angle*2*PI)*agent.speed;
    Nagent.oldx = agent.x;
    Nagent.oldy = agent.y;
    Nagent.count = agent.count+1;
    Nagent.speed = agent.speed;
    Nagent.col = color((frameCount/10)%100+100, (frameCount/1)%100+0, (frameCount/2)%40+60);
    Nagents.add(Nagent);
  }
  agents = Nagents;
}

class Position{
  float x;
  float y;
  float oldx;
  float oldy;
}

class Agent extends Position{
  float vecx;
  float vecy;
  int count;
  float zoff;
  float speed;
  color col;
}