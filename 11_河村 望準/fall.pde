class fallBlock{
  PVector point=new PVector(),ppoint=new PVector();
  boolean execute=true;
  int fall;
  PShape blo;
  fallBlock(float i,float j,float k){
    this.point.set(50+100*i,-50-100*j,50+100*k);
    this.ppoint.set(i,j,k);
    this.blo=block[12];
  }
  
  /*void check(){
    if(execute){
      try{
        //if(cie[int(this.point.x/100)][int(this.point.y/-100)][int(this.point.z)]==12){
        if(cie[int(this.point.x/100)][int(this.point.y/-100)-1][int(this.point.z)]==0 && fall==0){
          fall+=100;
          cie[int(this.ppoint.x)][int(this.ppoint.y)][int(this.ppoint.z)]=0;
          floor[int(this.ppoint.x)][int(this.ppoint.y)][int(this.ppoint.z)].delete();
          println("fall+=100");
        }
        if(cie[int(this.point.x/100)][int(this.point.y/-100)-1][int(this.point.z)]!=0 && fall==0){
          cie[int(this.point.x/100)][int(this.point.y/-100)][int(this.point.z)]=12;
          floor[int(this.point.x/100)][int(this.point.y/-100)][int(this.point.z)].changeBlock(12);
          execute=false;
        }
      }catch(Exception e){
      fall=1000;
      try{
      if(this.point.y<-50){
        cie[int(this.point.x/100)][int(this.point.y/-100)][int(this.point.z)]=0;
        floor[int(this.point.x/100)][int(this.point.y/-100)][int(this.point.z)].delete();
      }
      }catch(Exception ex){
      }
    }
    if(fall>0){
      fall-=2;
      point.y+=2;
    }
    pushMatrix();
    translate(this.point.x,this.point.y,this.point.z);
    scale(100);
    shape(this.blo);
    popMatrix();
  
  }
}*/
  
  void check(){
    try{
    if(execute){
      if(cie[int(this.ppoint.x)][int(this.ppoint.y)][int(this.ppoint.z)]==12){
        cie[int(this.ppoint.x)][int(this.ppoint.y)][int(this.ppoint.z)]=-12;
        floor[int(this.ppoint.x)][int(this.ppoint.y)][int(this.ppoint.z)].delete();
      }
      if(cie[int(this.point.x)/100][int(this.point.y)/-100][int(this.point.z)/100]==-12 && fall==0 && this.point.y<=-50){
        if(this.point.y<=-150){
          if(cie[int(this.point.x)/100][int(this.point.y)/-100-1][int(this.point.z)/100]!=0){
            cie[int(this.point.x)/100][int(this.point.y)/-100][int(this.point.z)/100]=12;
            floor[int(this.point.x)/100][int(this.point.y)/-100][int(this.point.z)/100].changeBlock(12);
            execute=false;
          }
          
          if(cie[int(this.point.x)/100][int(this.point.y)/-100-1][int(this.point.z)/100]==0){
            cie[int(this.point.x)/100][int(this.point.y)/-100][int(this.point.z)/100]=0;
            cie[int(this.point.x)/100][int(this.point.y)/-100-1][int(this.point.z)/100]=-12;
            fall+=100;
          }
        }
        if(this.point.y>-150){
          cie[int(this.point.x)/100][int(this.point.y)/-100][int(this.point.z)/100]=0;
          fall=1000;
        }
        
      }
      if(fall>0){
        fall-=5;
        point.y+=5;
        //println(fall);
      }
      pushMatrix();
      translate(this.point.x,this.point.y,this.point.z);
      scale(100);
      shape(this.blo);
      popMatrix();
    }
  }catch(Exception e){
  }
  }
}



ArrayList<fallBlock> fallList=new ArrayList<fallBlock>();
void fall(){
  for(int i=0;i<cie.length;i++){
    for(int j=0;j<cie[i].length;j++){
      for(int k=0;k<cie[i][j].length;k++){
        if(cie[i][j][k]==12){
          if(fallList.size()==0){
            fallList.add(new fallBlock(i,j,k));
          }
          for(int l=0;l<fallList.size();l++){
            if(i!=fallList.get(l).ppoint.x && j!=fallList.get(l).ppoint.y && k!=fallList.get(l).ppoint.z)
            fallList.add(new fallBlock(i,j,k));
          }
        }
        
      }
    }
  }
  /*Set<fallBlock> set=new HashSet<>();
    set.addAll(fallList);
    fallList.clear();
    fallList.addAll(set);*/
    
    
  for(int i=0;i<fallList.size();i++){
    if(!fallList.get(i).execute){
      println(fallList.get(i).ppoint+"is removed");
      fallList.remove(i);
    }
  }
  for(int i=0;i<fallList.size();i++){
    //println(fallList.get(i).ppoint);
    fallList.get(i).check();
  }
}
