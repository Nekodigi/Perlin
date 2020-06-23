PVector vortexAt(float x_, float y_, float noiseScale_, float zoff, float f){
  PVector p = new PVector(x_/noiseScale_, y_/noiseScale_);
  float x = (noise(p.x+EPSILON, p.y, zoff)-noise(p.x-EPSILON, p.y, zoff))/(2*EPSILON);
  float y = (noise(p.x, p.y+EPSILON, zoff)-noise(p.x, p.y-EPSILON, zoff))/(2*EPSILON);
  PVector grad = new PVector(x, y);
  grad.rotate(HALF_PI).mult(f);
  return grad;
}
