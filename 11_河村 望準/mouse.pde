int hold=1;
void mousePressed(){
  
  if(scene==1){
  if(mouseButton==LEFT){
    try{
    cie[(int)sight.get(sight.size()-1).x][(int)sight.get(sight.size()-1).y][(int)sight.get(sight.size()-1).z]=0;
    floor[(int)sight.get(sight.size()-1).x][(int)sight.get(sight.size()-1).y][(int)sight.get(sight.size()-1).z].delete();
    }catch(Exception e){
    }
  }
  if(mouseButton==RIGHT){
    try{
    if(cie[(int)sight.get(sight.size()-1).x][(int)sight.get(sight.size()-1).y][(int)sight.get(sight.size()-1).z]!=0 && sight.size()>1){
      cie[(int)sight.get(sight.size()-2).x][(int)sight.get(sight.size()-2).y][(int)sight.get(sight.size()-2).z]=hold;
      floor[(int)sight.get(sight.size()-2).x][(int)sight.get(sight.size()-2).y][(int)sight.get(sight.size()-2).z].changeBlock(hold);
      if(hold==17){
        int r=1;
        if((int)sight.get(sight.size()-1).x==(int)sight.get(sight.size()-2).x && (int)sight.get(sight.size()-1).y==(int)sight.get(sight.size()-2).y){
          r=100;
        }
        if((int)sight.get(sight.size()-1).z==(int)sight.get(sight.size()-2).z && (int)sight.get(sight.size()-1).y==(int)sight.get(sight.size()-2).y){
          r=1000;
        }
        /*if((int)sight.get(sight.size()-1).y!=(int)sight.get(sight.size()-2).y){
          r=1;
        }*/
        //if(verticalDegree>49 || verticalDegree<-49)r=1;
        
        cie[(int)sight.get(sight.size()-2).x][(int)sight.get(sight.size()-2).y][(int)sight.get(sight.size()-2).z]=hold*r;
        floor[(int)sight.get(sight.size()-2).x][(int)sight.get(sight.size()-2).y][(int)sight.get(sight.size()-2).z].changeBlock(hold*r);
      }
    }
    }catch(Exception e){
    }
  }
  }
}

void mouseWheel(MouseEvent event){
  pick+=event.getCount();
  pick=constrain(pick,0,9);
  println(pick);
}
