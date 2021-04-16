class Segment {
  float a;
  Segment s=null, e=null;
  PVector sp, ep;
  float len;
  Segment(float len) {
    this.a=0;
    this.len=len;
  }
  void follow() {
    this.follow(this.e.sp.x,this.e.sp.y);
  }
  void follow(float x, float y) {
    PVector d=new PVector (x-this.sp.x, y-this.sp.y);
    this.a=atan2(y-this.sp.y, x-this.sp.x);
    d.setMag(this.len);
    d.mult(-1);
    this.sp=new PVector(x+d.x, y+d.y);
  }
  void calc_ep() {
    this.ep=new PVector(this.len*cos(this.a)+this.sp.x, this.len*sin(this.a)+this.sp.y);
  }
  void draw() {
    noFill();
    stroke(255,128);
    strokeWeight(15);
    line(this.sp.x, this.sp.y, this.ep.x, this.ep.y);
  }
}
