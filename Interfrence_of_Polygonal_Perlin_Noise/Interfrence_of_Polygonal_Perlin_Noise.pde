int pSize = 10;
int n = 3;

void setup(){
  //size(500, 500);
  fullScreen();
}

void keyPressed(){
  if(keyCode == UP){
    n++;
  }
  if(keyCode == DOWN){
    n--;
  }
}

void draw(){
  float off = float(frameCount)/100;
  noStroke();
  for(float i = -width/2; i < width/2; i+=pSize){
    for(float j = -height/2; j < height/2; j+=pSize){
      float c = 0;
      for(int d = 0; d < n; d++){
        float t = new PVector(i, j).dot(PVector.fromAngle(TWO_PI/n*d))/height*10;
        c += noise(t + off);
      }
      fill((c*2550/n)%255);
      rect(i+width/2, j+height/2, pSize, pSize);
    }
  }
}