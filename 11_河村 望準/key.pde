boolean bw,ba,bs,bd,bspace,jump;

void keyPressed(){
  if(key=='w')bw=true;
  if(key=='a')ba=true;
  if(key=='s')bs=true;
  if(key=='d')bd=true;
  
  if(key==32)bspace=true;
  
  if(keyCode==UP)point.y-=10;
  if(keyCode==DOWN)point.y+=10;
  
  if (key == ESC) {
    cieSave();
    println("cie saved.");
    exit();
  }
  
  if(key=='1')pick=0;
  if(key=='2')pick=1;
  if(key=='3')pick=2;
  if(key=='4')pick=3;
  if(key=='5')pick=4;
  if(key=='6')pick=5;
  if(key=='7')pick=6;
  if(key=='8')pick=7;
  if(key=='9')pick=8;
  if(key=='0')pick=9;
}

void keyReleased(){
  if(key=='w')bw=false;
  if(key=='a')ba=false;
  if(key=='s')bs=false;
  if(key=='d')bd=false;
  
  if(key==32)bspace=false;
}
