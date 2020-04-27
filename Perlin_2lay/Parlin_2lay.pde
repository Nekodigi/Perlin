ArrayList<Agent> agents = new ArrayList<Agent>();
float off;
float bkoff;

void setup(){
  fullScreen(P2D);
  for(int i = 0; i < width; i+=1){
    Agent agent = new Agent();
    agent.x = i;
    agent.y = 0;
    agents.add(agent);
  }
  colorMode(HSB, 360, 100, 100, 100);
  background(360);
  frameRate(1000);
}

void draw(){
  ArrayList<Agent> Nagents = new ArrayList<Agent>();
  off += 0.002;
  bkoff+=random(0, 0.1);
  //beginShape();
  for(Agent agent: agents){
    //ellipse(agent.x, agent.y, 100,100);
    stroke(100+noise(agent.x/800, off/8)*200, noise(agent.x/800, off/8)*frameCount%100, 100, 100);
    point(agent.x, agent.y);
    Agent Nagent = new Agent();
    Nagent.y = agent.y + noise(agent.x/200, off)/2;
    Nagent.x = agent.x;
    Nagents.add(Nagent);
  }
  //noFill();
  //strokeWeight(1);
  //endShape();
  agents = Nagents;
}

class Agent{
  float x;
  float y;
  PVector speed = new PVector();
}