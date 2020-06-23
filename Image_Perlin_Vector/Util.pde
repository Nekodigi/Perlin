PVector perlinVecAt(float x_, float y_, float noiseScale_, float zoff, float f){
  return PVector.fromAngle(noise(x_/noiseScale_, y_/noiseScale_, zoff)*TWO_PI*4).mult(f);
}
