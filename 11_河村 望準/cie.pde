boolean ciesave;

/*void cieSave(){
  for(int i=0;i<cie[0].length;i++){
    String filename="y_"+i+".csv";
    String[] lines=new String[cie.length];
    for(int j=0;j<cie.length;j++){
      String line="";
      for(int k=0;k<cie[j][i].length;k++){
        line+=cie[j][i][k];
        if(k<cie[j][i].length-1){
          line+=",";
        }
      }
      lines[j]=line;
    }
    saveStrings(filename,lines);
  }
  ciesave=true;
}

void cieLoad(){
  byte[][][] load=new byte[cie.length][cie[0].length][cie[0][0].length];
  for(int i=0;i<cie[0].length;i++){
    String filename="y_"+i+".csv";
    String[] lines=loadStrings(filename);
    for(int j=0;j<lines.length;j++){
      String[] vals=split(lines[j],',');
      for(int k=0;k<vals.length;k++){
        try{
        load[j][i][k]=byte(int(vals[k]));
        }catch(Exception e){
        }
      }
    }
  }
  for(int i=0;i<cie.length;i++){
    for(int j=0;j<cie[i].length;j++){
      for(int k=0;k<cie[i][j].length;k++){
        cie[i][j][k]=load[i][j][k];
      }
    }
  }
}*/

void cieSave(){
  for(int i=0;i<cie[0].length;i++){
    String filename="y_"+i+".csv";
    String[] lines=new String[cie.length];
    for(int j=0;j<cie.length;j++){
      String line="";
      for(int k=0;k<cie[j][i].length;k++){
        line+=cie[j][i][k];
        if(k<cie[j][i].length-1){
          line+=",";
        }
      }
      lines[j]=line;
    }
    saveStrings(filename,lines);
  }
  ciesave=true;
}

void cieLoad(){
  for(int i=0;i<cie[0].length;i++){
    String filename="y_"+i+".csv";
    String[] lines=loadStrings(filename);
    for(int j=0;j<lines.length;j++){
      String[] vals=split(lines[j],',');
      for(int k=0;k<vals.length;k++){
        try{
        cie[j][i][k]=int(vals[k]);
        }catch(Exception e){
        }
      }
    }
  }
  load=40;
}
