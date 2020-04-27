float nScale = 100;
float pSize = 10;
float zoff = 0;

void setup(){
  fullScreen();
}

void draw(){
  background(0);
  noStroke();
  for(float y = 0; y < height; y+=pSize){
    for(float x = 0; x < width; x+=pSize){
      fill((sin(noise(x/nScale, y/nScale)*TWO_PI*2+zoff)+1)/2*255);
      rect(x, y, pSize, pSize);
    }
  }
  zoff += 0.1;
}