import java.awt.Robot;
import java.util.Set;
import java.util.HashSet;
import ddf.minim.*;

Minim minim;
Robot robot;
PShape[] block=new PShape[18];
Block[][][] floor=new Block[50][20][50];
int[][][] cie=new int[50][20][50];
int boxSize=100,scene;
boolean looking,keyBorad;
float load;
PImage loadgamen;
AudioPlayer BGM;
AudioPlayer[] footsteps=new AudioPlayer[18];

void setup(){
  surface.setLocation(0,0);
  noCursor();
  loadgamen=loadImage("load.png");
  loadgamen.resize(width,height);
  image(loadgamen,0,0);
  
  minim=new Minim(this);
  BGM=minim.loadFile("Mutation.mp3");
  //BGM.loop();
  
  block[1]=loadShape("1cube.obj");
  block[2]=loadShape("2cube.obj");
  block[3]=loadShape("3cube.obj");
  block[4]=loadShape("4cube.obj");
  block[5]=loadShape("5cube.obj");
  block[12]=loadShape("12cube.obj");
  block[17]=loadShape("17cube.obj");
  
  footsteps[1]=minim.loadFile("1walk.mp3");
  footsteps[2]=minim.loadFile("2walk.mp3");
  footsteps[3]=minim.loadFile("3walk.mp3");
  footsteps[4]=minim.loadFile("1walk.mp3");
  footsteps[5]=minim.loadFile("5walk.mp3");
  footsteps[12]=minim.loadFile("12walk.mp3");
  footsteps[17]=minim.loadFile("5walk.mp3");
  
  footsteps[3].setGain(-15);
  footsteps[5].setGain(300);
  footsteps[12].setGain(300);
  footsteps[17].setGain(300);
  
  
  cieLoad();
  
  //background(255,0,0);
  
  /*for(int i=0;i<20;i++){
    for(int j=0;j<20;j++){
      cie[i][0][j]=2;
    }
  }*/
  
  /*for(int i=0;i<floor.length;i++){
    for(int j=0;j<floor[i].length;j++){
      floor[i][j][1]=new Block(-300+100*i,height/2+300,-300+100*j,100,2);
      floor[i][j][0]=new Block(-300+100*i,height/2+200,-300+100*j,100,4);
    }
  }
  floor[10][10][0]=new Block(0,200,0,100,4);*/
  
  for(int i=0;i<floor.length;i++){
    for(int j=0;j<floor[i].length;j++){
      for(int k=0;k<floor[i][j].length;k++){
        try{
        if(cie[i][j][k]>=0){
          int r=0;
          if(cie[i][j][k]/100==17)r=100;
          if(cie[i][j][k]/1000==17)r=1000;
          if(r!=0)
          floor[i][j][k]=new Block(50+100*i,-50-100*j,50+100*k,100,int(cie[i][j][k])/r,r);
          floor[i][j][k]=new Block(50+100*i,-50-100*j,50+100*k,100,int(cie[i][j][k]),r);
        }
        }catch(Exception e){
        }
       }
    }
  }
  
  try{
  robot=new Robot();
  robot.mouseMove(width/2,height/2);
  }catch(Exception e){
    println(e+"  robot is enable");
  }
  
  load=20;
  fill(#FFFFFF);
  noStroke();
  rect(width*0.229,height*0.708,width*0.005417*load,height*0.0185);
  
  perspective(PI / 3, 1.77777777, 1, 2500);//5000
  
  
}


void draw(){
  
  if(scene==1){
  field();
  
  
  move();
  
  jump=false;//collisionの前において
  }
  
  for(int i=0;i<floor.length;i++){
    for(int j=0;j<floor[i].length;j++){
      for(int k=0;k<floor[i][j].length;k++){
        try{
          if(floor[i][j][k].data>0){
            floor[i][j][k].display();
        //floor[i][j][k].collision();
          }
        }catch(Exception e){
          continue;
        }
      }
    }
  }
  
  ArrayList<PVector> collision=new ArrayList<PVector>();
  collision.clear();
  int colradi=3;
  for(int i=-colradi;i<=colradi;i++){
    for(int j=-colradi;j<=colradi;j++){
      for(int k=-colradi;k<=colradi;k++){
        collision.add(new PVector(int(point.x)/100+i,int(-point.y)/100+j,int(point.z)/100+k));
      }
    }
  }
  for(int i=0;i<collision.size();i++){
    try{
      floor[int(collision.get(i).x)][int(collision.get(i).y)][int(collision.get(i).z)].collision();
    }catch(Exception e){
    }
  }
  
  point.add(move);
  
  if(scene==1)sound();//point.add(move)の後ろ
  
  look();
  
  TWO_D();
  camera(point.x,point.y,point.z,look.x,look.y,look.z,0,1,0);
  
  /*if(frameCount%100==0){
    if(floor[0][0][0].data==2)floor[0][0][0].delete();
    //if(floor[0][0][0].data==4)floor[0][0][0].changeBlock(2);
  }*/
  
  //println(point,move,rigid,besizeDegree,pmx,mouseX);
  fall();
  
  /*pushMatrix();
  stroke(255);
  strokeWeight(10);
  //line(width/2,height/2-50,width/2,height/2+50);
  //line(width/2-50,height/2,width/2+50,height/2);
  
  line(0,0,0,100,-200,100);
  popMatrix();*/
  
  
}
