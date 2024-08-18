void settings(){
  int screenWidth,screenHeight,displayheight=displayHeight;
  if(displayWidth<displayheight*16/9){
    screenWidth=displayWidth;
    screenHeight=displayWidth*9/16;
  }else{
    screenWidth=displayheight*16/9;
    screenHeight=displayheight;   
  }
  size(screenWidth,screenHeight,P3D);

}
