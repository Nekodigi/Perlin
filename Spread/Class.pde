class Agent{
  PVector pos = new PVector();
  float nScale = 1000;
  float zoff;
  
  Agent(float zoff){
    this.zoff = zoff;
    pos = new PVector(width/2, height/2);
  }
  
  void update(){
    //float angle = noise(pos.x/nScale, pos.y/nScale, zoff)*TWO_PI*4;
    float angle = (sin(noise(pos.x/nScale, pos.y/nScale, zoff/100)*TWO_PI*2+zoff)+1)/2*TWO_PI*4;
    pos.add(new PVector(cos(angle), sin(angle)));
    if(pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height){
      pos = new PVector(width/2, height/2);
    }
  }
  
  void show(){
    //pixels[(int)pos.y*width+(int)pos.x-1] = col;
    rect(pos.x, pos.y, 1, 1);//I want to use alpha
  }
}