int[] hotBar={0,1,2,3,4,5,12,17,7,8};

void hotBar(){
  
  hold=hotBar[pick];
  //fill(#AA7d7a70);
  fill(#AA969696);
  rectMode(CENTER);
  for(int i=0;i<10;i++){
    stroke(#CC747575);
    strokeWeight(6);
    rect(width/24*(i+7)+width/48,height/13*12,width/24-8,width/24-8);
    stroke(#BB9e9c95);
    strokeWeight(4);
    rect(width/24*(i+7)+width/48,height/13*12,width/24,width/24);
    
    if(i==pick){
      stroke(#BBFFFFFF);
      strokeWeight(10);
      rect(width/24*(i+7)+width/48,height/13*12,width/24-8,width/24-8);
    }
    
    if(hotBar[i]!=0){
      
      pushMatrix();
      translate(width/24*(i+7)+width/48,height/13*12);
      scale(width/35);
      rotateX(radians(-10));
      rotateY(radians(-20));
      try{
      shape(block[hotBar[i]]);
      }catch(Exception e){
      }
      popMatrix();
    }
  }
  
}
