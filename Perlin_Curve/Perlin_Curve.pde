PerlinCurve perlinCurve;

void setup(){
  size(500, 500);
  //fullScreen();
  perlinCurve = new PerlinCurve(width/2, height/2, 5, 100, 0.01);
}

void draw(){
  //background(255);
  fill(255, 10);
  rect(0, 0, width, height);
  perlinCurve.yoff += 0.001;
  perlinCurve.show();
  strokeWeight(10);
}

class PerlinCurve{
  PVector origin;
  float xoff;
  float yoff;
  float stepL;//step length
  float stepOff;//step noiseX offset
  float stepN;//number of steps
  
  PerlinCurve(float x, float y, float stepL, float stepN, float stepOff){
    this.origin = new PVector(x, y);
    this.stepL = stepL;
    this.stepN = stepN;
    this.stepOff = stepOff;
  }
  
  void show(){
    noFill();
    beginShape();
    PVector prev = origin.copy();
    vertex(prev.x, prev.y);
    float off = xoff;
    for(int i=0; i<stepN; i++){
      float angle = noise(off, yoff)*TWO_PI*8;
      prev.add(PVector.fromAngle(angle).mult(stepL));
      vertex(prev.x, prev.y);
      off+=stepOff;
    }
    endShape();
  }
}
