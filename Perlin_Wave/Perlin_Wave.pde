ArrayList<Agent> agents = new ArrayList<Agent>();
float xoff;

void setup(){
  fullScreen(JAVA2D);
  line(0, height/2, width, height/2);
}

void draw(){
  xoff+=0.01f;
  if(frameCount%1 == 0){
  for(int x = 0; x < width; x+=5){
    float angle = x*2*PI/width;
    float y = sin(angle+xoff)*height/4+height/2;
    y += (noise(angle, xoff)-0.5f)*height;
    Agent agent = new Agent();
    agent.x = x;
    agent.y = y;
    agent.starty = y;
    agents.add(agent);
    //ellipse(x, y, 10, 10);
  }
  }
  fill(255, 30);
  rect(0, 0, width, height);
  ArrayList<Agent> Iagents = new ArrayList<Agent>();
  for(Agent agent : agents){
    noStroke();
    fill(0, 10);
    rect(agent.x, agent.y, 5, 20);
    float dist = (agent.y-height/2);
    float diff = (agent.starty-height/2)-dist;
    float xmove = diff*0.2f;
    float ymove = dist*1;
    Agent Iagent = new Agent();
    Iagent.x = agent.x-xmove/100;
    Iagent.y = agent.y-ymove/100;
    Iagent.starty = agent.starty;
    Iagent.count = agent.count+=1;
    if(Iagent.count < 100){
      Iagents.add(Iagent);
    }
  }
  agents = Iagents;
  saveFrame("D:/DumpImages/######.tif");
}

class Agent{
  float x;
  float y;
  float starty;
  int count;
}
