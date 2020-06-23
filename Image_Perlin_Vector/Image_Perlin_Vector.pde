float outScale = 200;
float projScale = 500;
float f = 2;
float EPSILON = 0.01;
float zoff = 0;
PImage img;
boolean render = false;
Bicubic bicubic;

void setup(){
  //size(500, 500);
  size(1280, 720);
  //fullScreen();
  img = loadImage("FevCat.png");
  bicubic = new Bicubic(img);
}

void draw(){
  background(255);
  image(img, 0, 0, height/4, height/4);
  translate(width/2, height/2);
  float tileS = 5;
  if(render){ 
    tileS = 1;
  }else{
    
  }
  //show image
  noStroke();
  PVector o = new PVector(outScale+mouseX-width/2, outScale+mouseY-height/2);
  for(float x = 0; x < outScale*2; x+=tileS){
    for(float y = 0; y < outScale*2; y+=tileS){
      PVector p2 = new PVector(x, y);
      for(int i=0; i<10; i++){
        PVector pM = perlinVecAt(p2.x, p2.y, projScale, zoff, f);//-half_pi < phi(x) < half_pi, -pi < lamda(y) < pi
        p2.add(pM);
      }
      //p2 = new PVector(map(p2.x, -HALF_PI, HALF_PI, 0, img.width), map(p2.y, -PI, PI, 0, img.height));//0 < x < img.width, 0 < y < img.height
      //p.add(p2);
      p2 = new PVector(map(p2.x, 0, outScale*2, 0, img.width), map(p2.y, 0, outScale*2, 0, img.height));//println(p, img.height);
      if(p2.x > 0 && p2.x < img.width && p2.y > 0 && p2.y < img.height){
        fill(bicubic.colorAt(p2.x, p2.y));
        //fill(0); println(p2);
        //rect(p2.x, p2.y, tileS, tileS);
        //rect(p2.x, p2.y, tileS, tileS);
        rect(x-outScale, y-outScale, tileS, tileS);
      }
    }
  }
  zoff += 0.01;
}

void keyPressed(){
  if(key == 'r'){
    render = !render;
  }
}
