class Tentacle {
  ArrayList<Segment> sl;
  PVector s;
  Tentacle(PVector s, int sn) {
    this.s=s;
    this.gen(sn);
  }
  void gen(int sn) {
    this.sl=new ArrayList<Segment>();
    for (int i=0; i<sn; i++) {
      this.sl.add(new Segment(15));
    }
    int i=0;
    for (Segment s : this.sl) {
      if (i>0) {
        s.s=this.sl.get(i-1);
      } else {
        s.sp=this.s;
      }
      if (i<this.sl.size()-1) {
        s.e=this.sl.get(i+1);
      }
      i++;
    }
    for (Segment s : this.sl) {
      if (s.s!=null) {
        s.sp=s.s.ep.copy();
      }
      s.calc_ep();
    }
  }
  void update() {
    for (int i=this.sl.size()-1; i>=0; i--) {
      Segment s=this.sl.get(i);
      if (i==this.sl.size()-1) {
        s.follow(mouseX, mouseY);
      } else {
        s.follow();
      }
    }
    for (int i=0; i<this.sl.size(); i++) {
      Segment s=this.sl.get(i);
      if (i==0) {
        s.sp=this.s.copy();
      } else {
        s.sp=s.s.ep.copy();
      }
      s.calc_ep();
    }
  }
  void draw() {
    for (Segment s : this.sl) {
      s.draw();
    }
    fill(255, 0, 0);
    noStroke();
    circle(this.s.x, this.s.y, 20);
  }
}
