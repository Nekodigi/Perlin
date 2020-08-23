float scale = 1;//3
float sp = 1;//sapling
float noiseP = 1/sp*scale;
float centerAttr = 0.01/sp/scale;//center attract
float zoff = 0;
float zoffInc = 0.0005/sp;
float yoffInc = 0.001/sp;
float hueDiv = 20;
int iter = 10;
float noiseS = 100*scale;

PerlinCurve perlinCurve;

void setup(){
  size(500, 500);
  //fullScreen();
  blendMode(ADD);
  
  colorMode(HSB, 360, 100, 100, 100);
  perlinCurve = new PerlinCurve(0, 0, 5, 100, 0.01);
  strokeWeight(2);
  background(0);
}

void draw(){
  //background(255);
  translate(width/2, height/2);
  for(int i=0; i<iter; i++){
    fill(0, 100);
    noStroke();
    rect(0, 0, width, height);
    perlinCurve.yoff += yoffInc;
    perlinCurve.update();
    stroke((float(frameCount)/hueDiv*iter)%360, 100, 100, 3);
    perlinCurve.show();
    zoff += zoffInc;
  }
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
  
  void update(){
    float angle = noise(origin.x/noiseS, origin.y/noiseS, zoff)*TWO_PI*8;
    origin.add(PVector.fromAngle(angle).mult(noiseP));
    //if(origin.x < 0)origin.x = width;
    //if(origin.x > width)origin.x = 0;
    //if(origin.y < 0)origin.y = height;
    //if(origin.y > height)origin.y = 0;
    origin = PVector.lerp(origin, new PVector(0, 0), centerAttr);
    //origin = new PVector(constrain(origin.x, 0, width), constrain(origin.y, 0, height));
  }
  
  void show(){
    noFill();
    beginShape();
    PVector prev = origin.copy();
    vertex(prev.x*scale, prev.y*scale);
    float off = xoff;
    for(int i=0; i<stepN; i++){
      float angle = noise(off, yoff)*TWO_PI*8;
      prev.add(PVector.fromAngle(angle).mult(stepL));
      vertex(prev.x*scale, prev.y*scale);
      off+=stepOff;
    }
    endShape();
  }
}
