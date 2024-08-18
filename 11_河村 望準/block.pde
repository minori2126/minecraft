class Block{
  PShape blo; 
  PVector xyz=new PVector();
  int size,data,fall,rotate;
  boolean disp=false;
  Block(int x,int y,int z,int size,int data,int rotate){
    this.xyz.set(x,y,z);
    this.size=size;
    this.data=data;
    this.blo=block[this.data];
    if(rotate==100){
      this.rotate=1;
    }
    if(rotate==1000){
      this.rotate=2;
    }
  }
  void display(){
    if(this.data!=0)disp=true;
    else disp=false;
    if(disp){
    /*if(cie[int((this.xyz.x)/100)][int((this.xyz.y)/-100)][int((this.xyz.z)/100)]==12){
    try{
      this.blo=null;
      if(cie[int((this.xyz.x)/100)][int((this.xyz.y)/-100)-1][int((this.xyz.z)/100)]==0 && fall==0){
        fall+=100;
        cie[int((this.xyz.x)/100)][int((this.xyz.y)/-100)-1][int((this.xyz.z)/100)]=12;
        cie[int((this.xyz.x)/100)][int((this.xyz.y)/-100)][int((this.xyz.z)/100)]=0;
      }
    }catch(Exception e){
      fall=1000;
      if(int(this.xyz.y/-100)>=0)
        cie[int((this.xyz.x)/100)][int((this.xyz.y)/-100)][int((this.xyz.z)/100)]=0;
    }
    if(fall>0){
      fall-=2;
      this.xyz.y+=2;
    }
    if(cie[int((this.xyz.x)/100)][int((this.xyz.y)/-100)-1][int((this.xyz.z)/100)]!=0 && fall==0){
      this.blo=block[12];
    }
    }
    if(this.xyz.y<-800){
      this.data=0;
      this.blo=null;
    }*/
    
    pushMatrix();
    translate(this.xyz.x,this.xyz.y,this.xyz.z);
    scale(size);
    if(this.rotate==1)rotateX(radians(90));
    if(this.rotate==2)rotateZ(radians(90));
    shape(this.blo);
    popMatrix();
    }
  }
  
  void collision(){
    if(this.data>0){
    /*PVector next=PVector.add(point,move);
    boolean x=next.x+50>=this.xyz.x-this.size/2 && next.x-50<=this.xyz.x+this.size/2;
    boolean y=next.y-50<=this.xyz.y+this.size/2 && next.y+150>=this.xyz.y-this.size/2;
    boolean z=next.z+50>=this.xyz.z-this.size/2 && next.z-50<=this.xyz.z+this.size/2;*/
    PVector Move=move.copy();
      move.mult(0);
      if(Move.x>0){
        for(int i=0;i<=Move.x;i++){
          move.x=i;
          if(this.xyz.x-this.size/2<point.x+40+move.x && this.xyz.x+this.size/2>point.x-40+move.x && this.xyz.y-this.size/2<point.y+150 && this.xyz.y+this.size/2>point.y-40 && this.xyz.z-this.size/2<point.z+40 && this.xyz.z+this.size/2>point.z-40){
            move.x--;
            break;
          }
        }
      }
      if(Move.x<0){
        for(int i=0;i>=Move.x;i--){
          move.x=i;
          if(this.xyz.x-this.size/2<point.x+40+move.x && this.xyz.x+this.size/2>point.x-40+move.x && this.xyz.y-this.size/2<point.y+150 && this.xyz.y+this.size/2>point.y-40 && this.xyz.z-this.size/2<point.z+40 && this.xyz.z+this.size/2>point.z-40){
            move.x++;
            break;
          }
        }
      }
      if(Move.y>0){
        for(int i=0;i<=Move.y;i++){
          move.y=i;
          if(this.xyz.x-this.size/2<point.x+40 && this.xyz.x+this.size/2>point.x-40 && this.xyz.y-this.size/2<point.y+150+move.y && this.xyz.y+this.size/2>point.y-40+move.y && this.xyz.z-this.size/2<point.z+40 && this.xyz.z+this.size/2>point.z-40){
            move.y--;
            rigid=0;
            jump=true;
            break;
          }
        }
      }
      if(Move.y<0){
        for(int i=0;i>=Move.y;i--){
          move.y=i;
          if(this.xyz.x-this.size/2<point.x+40 && this.xyz.x+this.size/2>point.x-40 && this.xyz.y-this.size/2<point.y+150+move.y && this.xyz.y+this.size/2>point.y-40+move.y && this.xyz.z-this.size/2<point.z+40 && this.xyz.z+this.size/2>point.z-40){
            move.y++;
            rigid=0;
            break;
          }
        }
      }
      if(Move.z>0){
        for(int i=0;i<=Move.z;i++){
          move.z=i;
          if(this.xyz.x-this.size/2<point.x+40 && this.xyz.x+this.size/2>point.x-40 && this.xyz.y-this.size/2<point.y+150 && this.xyz.y+this.size/2>point.y-40 && this.xyz.z-this.size/2<point.z+40+Move.z && this.xyz.z+this.size/2>point.z-40+Move.z){
            //move.z--;
            break;
          }
        }
      }
      if(Move.z<0){
        for(int i=0;i>=Move.z;i--){
          move.z=i;
          if(this.xyz.x-this.size/2<point.x+40 && this.xyz.x+this.size/2>point.x-40 && this.xyz.y-this.size/2<point.y+150 && this.xyz.y+this.size/2>point.y-40 && this.xyz.z-this.size/2<point.z+40+Move.z && this.xyz.z+this.size/2>point.z-40+Move.z){
            //move.z++;
            break;
          }
        }
      }
      /*PVector next=PVector.add(point,move);
      if(next.x-50<this.xyz.x+this.size/2 && next.x+50>this.xyz.x-this.size/2 && next.y-50<=this.xyz.y+this.size/2 && next.y-50>=this.xyz.y && move.y<0 && next.z-50<this.xyz.z+this.size/2 && next.z+50>this.xyz.z-this.size/2){
        rigid=0;
      }
      if(next.x-50<this.xyz.x+this.size/2 && next.x+50>this.xyz.x-this.size/2 && next.y+150>=this.xyz.y-this.size/2-1 && next.y+150<=this.xyz.y+this.size/2 && move.y>0 && next.z-50<this.xyz.z+this.size/2 && next.z+50>this.xyz.z-this.size/2){
        rigid=0;
        jump=true;
      }*/
      
      /*if(point.x+50>this.xyz.x-this.size/2 && point.x+50<this.xyz.x && move.x>0){
        move.x=0;
      }
      if(point.x-50<this.xyz.x+this.size/2 && point.x-50>this.xyz.x && move.x<0){
        move.x=0;
      }
      if(point.z+50>this.xyz.z-this.size/2 && point.z+50<this.xyz.z && move.z>0){
        move.z=0;
      }
      if(point.z-50<this.xyz.z+this.size/2 && point.z-50>this.xyz.z && move.z<0){
        move.z=0;
      }
      if(point.y-50<this.xyz.y+this.size/2 && point.y-50>this.xyz.y && move.y<0){
        move.y=0;
        rigid=0;
      }
      if(point.y+150>this.xyz.y-this.size/2 && point.y+150<this.xyz.y && move.y>0){
        move.y=0;
        rigid=0;
        jump=true;
      }*/
      
  }
  }
  
  void changeBlock(int d){
    this.data=d;
    this.rotate=0;
      if(d/100==17 || d/1000==17){
      if(d/100==17){
        this.data=d/100;
        rotate=1;
      }
      if(d/1000==17){
        this.data=d/1000;
        rotate=2;
      }
    }
    
    this.blo=block[this.data];
  }
  void delete(){
    this.data=0;
    this.blo=null;
    this.rotate=0;
  }
  
}
