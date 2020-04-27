ArrayList<Agent> agents = new ArrayList<Agent>();
float noiseScale=1000;
float zoff;

void setup(){
  colorMode(HSB, 360, 100, 100, 100);
  fullScreen(JAVA2D);
  background(360);
  for(int i = 0; i < 1000; i++){
    Agent agent = new Agent();
    agent.x = random(0, width);
    agent.y = random(0, height);
    agent.zoff = zoff;
    agent.speed = random(0.09, 0.11);
    agent.col=color(0, 100, 100, 100);
    agents.add(agent);
  }
  frameRate(1200);
  loadPixels();
}

void draw(){
  zoff+=0.0001;
  //background(255);
  //fill(360, 1);
  //rect(0, 0, width, height);
  ArrayList<Agent> Nagents = new ArrayList<Agent>();
  for(Agent agent:agents){
    Agent Nagent = new Agent();
    Nagent.speed = agent.speed;
    float angle = map(noise(agent.x/noiseScale, agent.y/noiseScale, zoff), 0, 1, -PI, PI);
    if(agent.x <= 0 || agent.x >= width || agent.y <= 0 || agent.y >= height){
          agent.x = lerp(agent.x, width/2, 0.01);
          agent.y = lerp(agent.y, height/2, 0.01);
          Nagent.speed = 0-agent.speed;
          agent.vecx = -agent.vecx;
          agent.vecy = -agent.vecy;
          //agent.x = width/2;
          //agent.y = height/2;
    }
    else{
      //pixelRenderer;
      //pixels[(int)agent.y*width + (int)agent.x] = int((int)agent.col);//追加
      //pointRenderer;
      fill(agent.col);
      noStroke();
      rect(agent.x, agent.y, 1, 1);
    }
    Nagent.vecx = agent.vecx*0.95 + cos(angle*2*PI)*agent.speed;
    Nagent.vecy = agent.vecy*0.95 + sin(angle*2*PI)*agent.speed;
    Nagent.x = agent.x+agent.vecx;
    Nagent.y = agent.y+agent.vecy;
    Nagent.count = agent.count+1;
    Nagent.col = color(sin((float)frameCount/12000)*100+100, sin((float)frameCount/120)*40+60, sin((float)frameCount/1200)*40+60+random(0, 10));
    //Nagent.col = color((frameCount/10)%100+100, 100, 100);
    Nagents.add(Nagent);
  }
  agents = Nagents;
  //pixelRenderer;
      //updatePixels();
}

class Position{
  float x;
  float y;
}

class Agent extends Position{
  float vecx;
  float vecy;
  int count;
  float zoff;
  float speed;
  color col;
}