PVector look=new PVector();
float pmx,pmy,besizeDegree=-90,verticalDegree=0,kandoX=40,kandoY=40;
int mouseSet;
ArrayList<PVector> sight=new ArrayList<PVector>();

void look(){
  if(mouseSet==1){
    pmx=mouseX;
    pmy=mouseY;
    mouseSet=2;
  }
  if(mouseSet==0){
    mouseSet=1;
    robot.mouseMove(width/2,height/2);
  }
  if(mouseSet>0){
    besizeDegree+=(mouseX-pmx)/kandoX;
    verticalDegree+=(mouseY-pmy)/kandoY;
    verticalDegree=constrain(verticalDegree,-89.9,89.9);
    robot.mouseMove(width/2,height/2);
    
    look.x=cos(radians(besizeDegree))*cos(radians(verticalDegree));
    look.y=sin(radians(verticalDegree));
    look.z=sin(radians(besizeDegree))*cos(radians(verticalDegree));
    //println(look,besizeDegree,verticalDegree);
    //look.setMag(0.001);
    
    sight.clear();
    
    for(int i=0;i<500;i++){
      PVector l=look.copy();
      l.setMag(i);
      l.add(point);
      sight.add(new PVector(int(l.x/100),int(l.y/-100),int(l.z/100)));
      Set<PVector> set=new HashSet<>();
      set.addAll(sight);
      sight.clear();
      sight.addAll(set);
      try{
      if(cie[int(l.x/100)][int(l.y/-100)][int(l.z/100)]!=0)break;
      }catch(Exception e){
      }
    }
    sight.remove(0);
    
    try{
    if(sight.get(0).x==(int)point.x/100 && sight.get(0).y==(int)point.y/-100-1 && sight.get(0).z==(int)point.z/100)
    sight.remove(0);
    if(point.x%100<40 && point.z%100<40){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j>=-1;j--){
          for(int k=0;k>=-1;k--){
            if(sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
            if((int)point.y%-100<-60 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100+1 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
            if((int)point.y%-100>-50 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100-1 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
          }
        }
      }
    }else if(point.x%100>60 && point.z%100<40){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j<=1;j++){
          for(int k=0;k>=-1;k--){
            if(sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
            if((int)point.y%-100<-60 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100+1 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
            if((int)point.y%-100>-50 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100-1 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
          }
        }
      }
    }else if(point.x%100<60 && point.z%100>40){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j>=-1;j--){
          for(int k=0;k<=1;k++){
            if(sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
          }
        }
      }
    }else if(point.x%100>60 && point.z%100>60){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j<=1;j++){
          for(int k=0;k<=1;k++){
            if(sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
            if((int)point.y%-100<-60 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100+1 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
            if((int)point.y%-100>-50 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100-1 && sight.get(i).z==(int)point.z/100+k){
            sight.remove(i);
            }
          }
        }
      }
    }else if(point.x%100<40){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j>=-1;j--){
          if(sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100){
            sight.remove(i);
          }
          if((int)point.y%-100<-60 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100+1 && sight.get(i).z==(int)point.z/100){
          sight.remove(i);
          }
          if((int)point.y%-100>-50 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100-1 && sight.get(i).z==(int)point.z/100){
          sight.remove(i);
          }
        }
      }
    }else if(point.x%100>60){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j<=1;j++){
          if(sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100){
            sight.remove(i);
          }
          if((int)point.y%-100<-60 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100+1 && sight.get(i).z==(int)point.z/100){
          sight.remove(i);
          }
          if((int)point.y%-100>-50 && sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100-1 && sight.get(i).z==(int)point.z/100){
          sight.remove(i);
          }
        }
      }
    }else if(point.z%100<40){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j>=-1;j--){
          if(sight.get(i).x==(int)point.x/100 && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100+j){
            sight.remove(i);
          }
          if((int)point.y%-100<-60 && sight.get(i).x==(int)point.x/100 && sight.get(i).y==(int)point.y/-100+1 && sight.get(i).z==(int)point.z/100+j){
          sight.remove(i);
          }
          if((int)point.y%-100>-50 && sight.get(i).x==(int)point.x/100 && sight.get(i).y==(int)point.y/-100-1 && sight.get(i).z==(int)point.z/100+j){
          sight.remove(i);
          }
        }
      }
    }else if(point.z%100>60){
      for(int i=0;i<sight.size();i++){
        for(int j=0;j<=1;j++){
          if(sight.get(i).x==(int)point.x/100+j && sight.get(i).y==(int)point.y/-100 && sight.get(i).z==(int)point.z/100){
            sight.remove(i);
          }
          if((int)point.y%-100<-60 && sight.get(i).x==(int)point.x/100 && sight.get(i).y==(int)point.y/-100+1 && sight.get(i).z==(int)point.z/100+j){
          sight.remove(i);
          }
          if((int)point.y%-100>=-50 && sight.get(i).x==(int)point.x/100 && sight.get(i).y==(int)point.y/-100-1 && sight.get(i).z==(int)point.z/100+j){
          sight.remove(i);
          }
        }
      }
    }
    }catch(Exception e){
    }
    
    look.add(point);
  }
}
