int res = 100;
int gen = 20;//to store generation
float baseR = 2;
float[][] prevRs = new float[gen][res];

void setup(){
  //fullScreen();
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(360);
  translate(width/2, height/2);
  float zoff = float(frameCount)/50;
  //push out old data
  for(int j = gen-1; j >= 1; j--){
    for(int i = 0; i < res; i++){
      prevRs[j][i] = prevRs[j-1][i];
    }
  }
  for(int i = 0; i < res; i++){
    float theta = map(i, 0, res, 0, TWO_PI);
    float r = noise(1+cos(theta), 1+sin(theta), zoff)*baseR;//+1 to avoid simmetry
    prevRs[0][i] = r;
  }
  float[] accRs = new float[res];//accumulated r
  //calculate accRs first
  for(int j = 0; j < gen; j++){
    for(int i = 0; i < res; i++){
      accRs[i] += prevRs[j][i]*pow(j, 0.8);
    }
  }
  //show
  for(int j = 0; j < gen; j++){
    //fill(150, noise(j, zoff)*100, noise(j, zoff, 1)*50+50);
    fill(200+noise(float(j)/10, zoff)*20, noise(j, zoff)*100, 100);
    beginShape();
    for(int i = 0; i < res; i++){
      float theta = map(i, 0, res, 0, TWO_PI);
      accRs[i] -= prevRs[j][i]*pow(j, 0.8);
      float r = accRs[i];
      vertex(cos(theta)*r, sin(theta)*accRs[i]);
    }
    endShape(CLOSE);
  }
}
