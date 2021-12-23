final int SEGMENT_SIZE=15;
final int SEGMENT_CIRCLE_SIZE=20;
final int SEGMENT_COUNT=40;
final int GRAVITY=1;



ArrayList<Tentacle> tl;



void setup(){
	size(2048,1024);
	tl=new ArrayList<Tentacle>();
	int w=3;
	int h=3;
	for (int i=0;i<w;i++){
		for (int j=0;j<h;j++){
			tl.add(new Tentacle(new PVector(width*((float)(i+1)/(w+1)),height*((float)(j+1)/(h+1))),SEGMENT_COUNT));
		}
	}
}



void draw(){
	background(0);
	for (Tentacle t:tl){
		t.update();
		t.draw();
	}
}
