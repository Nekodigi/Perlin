ArrayList<Agent> agents = new ArrayList<Agent>();
float noiseS = 200;//noise scale
float agentS = 5;//agent size
float colFac = 1;

void setup(){
  size(500, 500);
  //fullScreen();
  noStroke();
  fill(255);
  background(0);
}

void draw(){
  loadPixels();if(frameCount %5 == 0)agents.add(new Agent(colFac));
  for(Agent agent : agents){
    agent.show();
    agent.update();
  }
  colFac *= 0.998;
}

void mousePressed(){
  agents = new ArrayList<Agent>();
  noiseS = random(25, 400);
  colFac = 1;
  background(0);
}
