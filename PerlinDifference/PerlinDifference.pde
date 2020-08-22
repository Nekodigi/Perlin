float nScale = 100;
float pSize = 10;
float zoff = 0;
float zdiff = 0;

void setup(){
  //fullScreen();
  size(500, 500);
}

void draw(){
  background(0);
  noStroke();
  zdiff = map(mouseX, 0, width, 0, 1);
  for(float y = 0; y < height; y+=pSize){
    for(float x = 0; x < width; x+=pSize){
      fill(abs(noise(x/nScale, y/nScale, zoff)-noise(x/nScale, y/nScale, zoff+zdiff))*255*2);
      //fill(noise(x/nScale, y/nScale, zoff)*255);
      rect(x, y, pSize, pSize);
    }
  }
  zoff += 0.01;
}
