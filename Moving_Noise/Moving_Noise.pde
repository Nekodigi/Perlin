int pSize = 2;

void setup(){
  size(500, 500);
  //fullScreen();
}

void draw(){
  float off = float(frameCount)/100;
  noStroke();
  for(float i = 0; i < width; i+=pSize){
    for(float j = 0; j < height; j+=pSize){
      float c = noise(i/height*10+off, j/height*10+off);
      fill(c*1255%255);
      rect(i, j, pSize, pSize);
    }
  }
}