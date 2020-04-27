ArrayList<Agent> agents = new ArrayList<Agent>();
float zoff = 0;
int maxAgent = 4000;

void setup(){
  //size(500, 500);
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  background(360);
}

void keyPressed(){
  if(key=='r'){
    background(360);
    agents = new ArrayList<Agent>();
  }
}

void draw(){
  noStroke();
  for(int i = 0; i < 10; i++){
    agents.add(new Agent(zoff));
    if(agents.size() > maxAgent){
      agents.remove(0);
    }//sin(zoff)*50+50
    fill((zoff)%360+200, 100, 100, sin(zoff*10)*2+2);
    for(Agent agent : agents){
      agent.update();
      agent.show();
    }
    zoff += 0.001;
  }
}