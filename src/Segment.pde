class Segment{
	float a;
	Segment s=null;
	Segment e=null;
	PVector sp;
	PVector ep;
	float len;



	Segment(float len){
		this.a=PI/2;
		this.len=len;
	}



	void follow(){
		this.follow(this.e.sp.x,this.e.sp.y);
	}



	void follow(float x,float y){
		float dx=x-this.sp.x;
		float dy=y-this.sp.y;
		this.a=atan2(dy,dx);
		float m=this.len/sqrt(dx*dx+dy*dy);
		this.sp=new PVector(x-dx*m,y-dy*m+GRAVITY);
	}



	void calc_ep(){
		this.ep=new PVector(this.len*cos(this.a)+this.sp.x,this.len*sin(this.a)+this.sp.y);
	}



	void draw(){
		noFill();
		stroke(255,128);
		strokeWeight(15);
		line(this.sp.x,this.sp.y,this.ep.x,this.ep.y);
	}
}
