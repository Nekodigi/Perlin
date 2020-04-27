float zoff = 0;

void setup(){
  //size(500, 500);
  fullScreen();
  colorMode(HSB, 360, 100, 100);
  background(255);
  strokeWeight(10);
}

void draw(){
  fill(360, 20);
  rect(0, 0, width, height);
  translate(width/2, height/2);
  stroke(zoff*36%360, 100, 100);
  beginShape();
  for(float theta = 0; theta < TWO_PI; theta+=0.01){
    float r = noise(cos(theta)+1, sin(theta)+1, zoff)*height/2;//noise function is symmetry
    vertex(cos(theta)*r, sin(theta)*r);
  }
  endShape();
  zoff += 0.01;
}