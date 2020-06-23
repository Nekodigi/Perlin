class Bicubic{
  float[] xx;//mesh grid
  float[] yy;//mesh grid
  float[][] r;
  float[][] g;
  float[][] b;
  Bicubic(PImage img){
    xx = range(img.width+1);
    yy = range(img.height+1);
    r = new float[xx.length][yy.length];
    g = new float[xx.length][yy.length];
    b = new float[xx.length][yy.length];
    for (int i = 0; i < xx.length; i++) {
      for (int j = 0; j < yy.length; j++) {
        r[i][j] = red(img.get(i, j));
        g[i][j] = green(img.get(i, j));
        b[i][j] = blue(img.get(i, j));
      }
    }
  }
  
  color colorAt(float x, float y){
    float r_ = solve(xx, yy, r, x, y);
    float g_ = solve(xx, yy, g, x, y);
    float b_ = solve(xx, yy, b, x, y);
    return color(r_, g_, b_);
  }

  public float[][] solve(float[] xi, float[] yi, float[][] zi, float[] xnew, float[] ynew){//xi,yi must be sorted
    float[][] z = new float[xnew.length][ynew.length];
    
    for(int n = 0; n < xnew.length; n++){
      float x = xnew[n];
      for(int m = 0; m < ynew.length; m++){
        float y = ynew[m];
        
        
        z[n][m] = solve(xi, yi, zi, x, y);
      }
    }
    return z;
    
  }

  float solve(float[] xi, float[] yi, float[][] zi, float x, float y){//xi,yi must be sorted
    
    int i = searchsorted(xi, x)-1;//get upper left index
    int j = searchsorted(yi, y)-1;
    
    float px = 1.;
    float py = 1.;
    
    if(i != -1){
      float x1 = xi[i];
      float x2 = xi[i+1];
      px = (x-x1)/(x2-x1);//normalize position
    }
    if(j != -1){
      float y1 = yi[j];
      float y2 = yi[j+1];
      py = (y-y1)/(y2-y1);
    }
    
    float f00 = zi[max(0, i-1)][max(0, j-1)];
    float f01 = zi[max(0, i-1)][max(0, j)];
    float f02 = zi[max(0, i-1)][j+1];
    float f03 = zi[max(0, i-1)][min(yi.length-1, j+2)];
    
    float f10 = zi[max(0, i)][max(0, j-1)];
    float f11 = zi[max(0, i)][max(0, j)];
    float f12 = zi[max(0, i)][j+1];
    float f13 = zi[max(0, i)][min(yi.length-1, j+2)];
    
    float f20 = zi[i+1][max(0, j-1)];
    float f21 = zi[i+1][max(0, j)];
    float f22 = zi[i+1][j+1];
    float f23 = zi[i+1][min(yi.length-1, j+2)];
    
    float f30 = zi[min(xi.length-1, i+2)][max(0, j-1)];
    float f31 = zi[min(xi.length-1, i+2)][max(0, j)];
    float f32 = zi[min(xi.length-1, i+2)][j+1];
    float f33 = zi[min(xi.length-1, i+2)][min(yi.length-1, j+2)];
    
    float[][] Z = {{f00, f10, f20, f30},
                   {f01, f11, f21, f31},
                   {f02, f12, f22, f32},
                   {f03, f13, f23, f33}};
                   
    float[][] Xinv = {{-1./6, 1./2, -1./3, 0},
                      { 1./2,   -1, -1./2, 1},
                      {-1./2, 1./2,     1, 0},
                      { 1./6,    0, -1./6, 0}};
                      
    float[][] Cr = dot(Z, Xinv);
    float[] T1 = {pow(px, 3), pow(px, 2), px, 1};
    float[] R = dot(Cr, T1);
    
    float[][] Yinv = transpose(Xinv);
    float[] Cc = dot(Yinv, R);
    float[] T2 = {pow(py, 3), pow(py, 2), py, 1};
    
    return dot(Cc, T2);
    
  }
}
