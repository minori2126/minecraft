void TWO_D(){
  
  camera();
  ortho();
  if(scene==0){
    if(load<100){
      pushMatrix();
      rectMode(CORNER);
      image(loadgamen,0,0);
      fill(#FFFFFF);
      noStroke();
      rect(width*0.229,height*0.708,width*0.005417*load,height*0.0185);
      load+=0.25;
      popMatrix();
    }else scene=1;
  }
  
  if(scene==1){
  strokeWeight(2);
  stroke(#90FFFFFF);
  line(width/2-20,height/2,width/2+20,height/2);
  line(width/2,height/2-20,width/2,height/2+20);
  
  
  //line(width/2,0,width/2,height);
  
  hotBar();
  textSize(50);
  fill(255,0,0);
  //text(cie[(int)point.x/100][(int)point.y/-100-2][(int)point.z/100],300,300);
  }
  
  perspective(PI / 3, 1.77777777, 1, 2500);
}
