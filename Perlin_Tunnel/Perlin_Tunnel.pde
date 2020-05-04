float boff;

void setup(){
  fullScreen(P3D);
  perspective(1, float(width)/float(height), 1.0, 60000.0);
}

void draw(){
  boff += 0.01;
  background(255);
  float off = boff;
  for(int range = 0; range < width; range+= 10){
    off += 0.01;
    noFill();
    stroke(map(range, 0, width, 0, 255));
    //ellipse(width/2, height/2, width, width);
    beginShape();
    curveVertex(cos(radians(-10))*width+width/2+noise(-10/10, off)*1000, sin(radians(-10))*width+height/2+noise(-10/10, off)*1000);
    for(int angle = 0; angle<360; angle+=10){
      curveVertex(cos(radians(angle))*width+width/2+noise(angle/10, off)*1000, sin(radians(angle))*width+height/2+noise(angle/1000, off)*1000);
    }
    curveVertex(cos(radians(360))*width+width/2+noise(0, off)*1000, sin(radians(360))*width+height/2+noise(0, off)*1000);
    curveVertex(cos(radians(370))*width+width/2+noise(10/10, off)*1000, sin(radians(370))*width+height/2+noise(10/10, off)*1000);
      endShape();
    translate(map(noise(off+10), 0, 1, -50, 50), map(noise(off), 0, 1, -50, 50), -100);
  }
  saveFrame("D:/Dump2/######.tif");
}
