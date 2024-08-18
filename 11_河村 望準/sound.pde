boolean isMove;
float sub;
void sound(){
  PVector pointXZ=new PVector(point.x,point.z);
  if(ppoint.sub(pointXZ).mag()>=1)isMove=true;
  else isMove=false;
  ppoint.set(point.x,point.z);
  
  if(jump && isMove){
    try{
      footsteps[cie[(int)point.x/100][(int)point.y/-100-2][(int)point.z/100]].play();
    }catch(Exception e){
    }
  }else{
    for(int i=0;i<footsteps.length;i++){
      try{
          footsteps[i].pause();
          footsteps[i].rewind();
      }catch(Exception e){
      }
    }
  }
}
