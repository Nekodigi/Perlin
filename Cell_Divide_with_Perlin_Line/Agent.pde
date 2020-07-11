class Agent{
  PVector posp, posn;//positive agent, negative agent
  boolean enp = true, enn = true;//enable positive, disable positive
  float off, bangle;//noise zoffset , base angle
  
  Agent(){
    posp = new PVector(random(width), random(height));
    posn = posp.copy();
    off = random(0);
    bangle = random(TWO_PI);
  }
  
  void update(){
    if(enp){
      float angle = noise(posp.x/noiseS, posp.y/noiseS, off)*4;
      posp.add(PVector.fromAngle(angle+bangle).mult(agentS));
      if(brightness(pixels[canvIX(posp)]) != 0)enp = false;
    }
    if(enn){
      float angle = noise(posn.x/noiseS, posn.y/noiseS, off)*4;
      posn.add(PVector.fromAngle(angle+bangle).mult(-agentS));
      if(brightness(pixels[canvIX(posn)]) != 0)enn = false;
    }
  }
  
  void show(){
    if(enp)rect(posp.x, posp.y, agentS, agentS);
    if(enn)rect(posn.x, posn.y, agentS, agentS);
  }
}
