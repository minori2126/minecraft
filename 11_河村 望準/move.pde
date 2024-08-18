PVector point=new PVector(100,-250,100),move=new PVector(),ppoint=new PVector();
PVector vw=new PVector(),va=new PVector(),vs=new PVector(),vd=new PVector();


float speed=10,rigid,gAcc=1;

void move(){
  if(bw){
    vw.x=cos(radians(besizeDegree));
    vw.z=sin(radians(besizeDegree));
  }else vw.mult(0);
  if(ba){
    va.x=cos(radians(besizeDegree+270));
    va.z=sin(radians(besizeDegree+270));
  }else va.mult(0);
  if(bs){
    vs.x=cos(radians(besizeDegree+180));
    vs.z=sin(radians(besizeDegree+180));
  }else vs.mult(0);
  if(bd){
    vd.x=cos(radians(besizeDegree+90));
    vd.z=sin(radians(besizeDegree+90));
  }else vd.mult(0);
  
  if (bw && bs) {
    vw.mult(0);
    vs.mult(0);
  }
  if (ba && bd) {
    va.mult(0);
    vd.mult(0);
  }
  move.mult(0);
  move.add(vw).add(va).add(vs).add(vd);
  move.setMag(speed);
  //point.add(move);ここにあるとcollisionとかが意味をなさなくなると思うから移動
  
  if(bspace && jump){
    rigid-=18;
    jump=false;
  }
  rigid+=gAcc;
  //rigid=constrain(rigid,-50,50);
  move.y=rigid;//jumpするとrigidに初速度を与える
  //move.y=constrain(move.y,-50,50);
  
}
