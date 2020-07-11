int canvIX(int i, int j){
  return j*width+i;
}

int canvIX(PVector p){
  return canvIX(constrain((int)p.x, 0, width-1), constrain((int)p.y, 0, height-1));
}
