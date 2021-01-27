ArrayList<Tentacle> tl;
void setup() {
  size(2000, 1600);
  tl=new ArrayList<Tentacle>();
  int w=3,h=3;
  for (int i=0; i<w; i++) {
    for (int j=0; j<h; j++) {
      tl.add(new Tentacle(new PVector(width*((float)(i+1)/(w+1)), height*((float)(j+1)/(h+1))), 30));
    }
  }
}

void draw() {
  background(0);
  for (Tentacle t : tl) {
    t.update();
    t.draw();
  }
}
