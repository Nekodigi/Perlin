ArrayList<Agent> agents = new ArrayList<Agent>();
float noiseS = 200;//noise scale
float agentS = 5;//agent size

void setup(){
  //size(500, 500);
  fullScreen();
  noStroke();
  fill(255);
  background(0);
  agents.add(new Agent());
}

void draw(){
  loadPixels();if(frameCount %5 == 0)agents.add(new Agent());
  for(Agent agent : agents){
    agent.show();
    agent.update();
  }
}

void mousePressed(){
  agents = new ArrayList<Agent>();
  noiseS = random(25, 400);
  background(0);
}
