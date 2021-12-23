class Tentacle{
	ArrayList<Segment> sl;
	PVector s;
	int _lmx=0;
	int _lmy=0;



	Tentacle(PVector s,int sn){
		this.s=s;
		this._lmx=width/2;
		this._lmy=height/2;
		this.gen(sn);
	}



	void gen(int sn){
		this.sl=new ArrayList<Segment>();
		for (int i=0;i<sn;i++){
			this.sl.add(new Segment(SEGMENT_SIZE));
		}
		int i=0;
		for (Segment s:this.sl){
			if (i>0){
				s.s=this.sl.get(i-1);
			}
			else{
				s.sp=this.s;
			}
			if (i<this.sl.size()-1){
				s.e=this.sl.get(i+1);
			}
			i++;
		}
		for (Segment s:this.sl){
			if (s.s!=null){
				s.sp=s.s.ep.copy();
			}
			s.calc_ep();
		}
	}



	void update(){
		if (mousePressed){
			this._lmx=mouseX;
			this._lmy=mouseY;
		}
		this.sl.get(this.sl.size()-1).follow(this._lmx,this._lmy);
		for (int i=this.sl.size()-2;i>=0;i--){
			this.sl.get(i).follow();
		}
		for (int i=0;i<this.sl.size();i++){
			Segment s=this.sl.get(i);
			if (i==0){
				s.sp=this.s.copy();
			}
			else{
				s.sp=s.s.ep.copy();
			}
			s.calc_ep();
		}
	}



	void draw(){
		for (Segment s:this.sl){
			s.draw();
		}
		fill(255,0,0);
		noStroke();
		circle(this.s.x,this.s.y,SEGMENT_CIRCLE_SIZE);
	}
}
