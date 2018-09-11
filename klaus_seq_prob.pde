/*

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


import themidibus.*;

import java.util.Random;


MidiBus seq;

Minim minim;
Oscil wave;        //minim
AudioOutput out;
AudioInput in;
Midi2Hz midi;

int tempo,var,range,  lastMillis,lastNote;
boolean firstOn,firstOff;
int[] jonico= {0,2,4,5,7,9,11};
int[] dorico= {0,2,3,5,7,9,10};
int[] frigio= {0,1,3,5,7,8,10};
int[] lidio= {0,2,4,6,7,9,11};
int[] mixolidio= {0,2,4,5,7,9,10};
int[] eolico= {0,2,3,5,7,8,10};
int[] locrio= {0,1,3,5,6,8,10};
int[] disminuido= {0,1,3,5,6,8,9};

int[] probabilidad= new int[7];
int[] rangeArray= {0,12,-12,24,-24};

int progLength=4;                   //largo de la progre



int indice=1,lastIndice=0;
  
int primera, tercera, quinta, septima;

int C=60,Csharp=61, D=62,Dsharp=63, E=64, F=65,Fsharp=66, G=67,Gsharp=68, A=69,Asharp=70, B=71;


int[] miprogresion= {60,65,62,67};  //ejemplo
int[][] misescalas= new int[][] {jonico,lidio,dorico,mixolidio};





///////////////////////////////////////////////////////////////////////////////////


void TEMPO(int theTempo){
  tempo=theTempo;
}

void RANGO(int theRange){
  if (theRange<20) range=0;
  if ( (theRange>20)&&(theRange<40) ) range=3;
  if ( (theRange>40)&&(theRange<60) ) range=5;

}

void VARIACION(int theVar){
  if (theVar<20) probabilidad=new int[] {50,0,0,0,50,0,0};
  if ( (theVar>20)&&(var<40) ) probabilidad=new int[] {33,0,33,0,33,0,0};
  if ( (theVar>40)&&(var<60) ) probabilidad=new int[] {30,0,30,0,30,0,10};
  if ( (theVar>60)&&(var<80) ) probabilidad=new int[] {20,10,20,0,20,10,20};
  if ( (theVar>80)&&(var<=100) ) probabilidad=new int[] {20,7,20,6,20,7,20};
}
  

void siguiente(){
  if (indice!=progLength-1) indice++; else if (indice==progLength-1) indice=0; 
}

void anterior(){
  if (indice!=0) indice--;
}

void sequencer(){

  background(0);
     

  //Draw the waveform
  
 /* 
    for(int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i, 50 + in.left.get(i)*50, i+1, 50 + in.left.get(i+1)*50 );
    line( i, 150 + in.right.get(i)*50, i+1, 150 + in.right.get(i+1)*50 );
  }
  
  //
  
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i*(displayWidth/out.bufferSize()), displayHeight/2 + in.left.get(i)*100, (i+1)*(displayWidth/out.bufferSize()), displayHeight/2 + in.left.get(i+1)*100 );
    line( i*(displayWidth/out.bufferSize()), displayHeight/2 + in.right.get(i)*100, (i+1)*(displayWidth/out.bufferSize()), displayHeight/2 + in.right.get(i+1)*100 );    
  }  
  
  
  
  
  
  

 
 
  //nueva nota para mi progresion 
 int rand=int ( random(100) ), probAcu=0, offset=12;


 for (int i=0;i<=6;i++){
   if ( (rand>=probAcu)&&(rand<=probabilidad[i]+probAcu)) {rand=i;break;} else probAcu=probAcu+probabilidad[i];
 }
   
   if (indice!=progLength-1){
     if (abs(miprogresion[indice]-miprogresion[indice+1])>5) offset=0; }
     else if (abs(miprogresion[indice]-miprogresion[0])>5) offset=0;
     
   

// int newNote=miprogresion[indice]+ misescalas[indice][ rand]+offset+rangeArray[int(random(range))] ;
 int newNote=newRandomNote(rand)+offset;
 

   if (millis() <= lastMillis + tempo) { 
     if (firstOn==true){
       seq.sendNoteOn(0,newNote,100);
       
       midi.setMidiNoteIn(newNote);
       midi.patch(wave.frequency);        //minim
       wave.setAmplitude(0);
       
       lastNote=newNote;
       firstOn=false;
     }
     if (millis() >= lastMillis + tempo/1.1){
       if (firstOff==true){
         seq.sendNoteOff(0,lastNote,100);
         
         wave.setAmplitude(0);      //minim
         
         firstOff=false;
     }  
   }


  } 
  else if (millis() >= lastMillis + tempo) {
    lastMillis = millis();
    firstOn=true;
    firstOff=true;
  }
  
  
 // println(newNote);

}
  
int newRandomNote(int randomNum){
  int newNote=0; 
  
  newNote=getTonica();    
  newNote=newNote+getEscala()[randomNum]; 
  
  newNote=newNote+rangeArray[int(random(range))] ;
  println(notas.length);

 // delay(12222);

  if (notas[indice]=="C ") println("aa");
  return newNote;
   
   
   
}
  
void newChord(){
  
  
}


int getTonica(){
  if (notas[indice].charAt(0)=='C'  &&  notas[indice].charAt(1)==' ') return 60;
  if (notas[indice].charAt(0)=='C'  &&  notas[indice].charAt(1)=='#') return 61;
  if (notas[indice].charAt(0)=='D'  &&  notas[indice].charAt(1)==' ') return 62;
  if (notas[indice].charAt(0)=='D'  &&  notas[indice].charAt(1)=='#') return 63;
  if (notas[indice].charAt(0)=='E'  &&  notas[indice].charAt(1)==' ') return 64;
  if (notas[indice].charAt(0)=='F'  &&  notas[indice].charAt(1)==' ') return 65;
  if (notas[indice].charAt(0)=='F'  &&  notas[indice].charAt(1)=='#') return 66;
  if (notas[indice].charAt(0)=='G'  &&  notas[indice].charAt(1)==' ') return 67;
  if (notas[indice].charAt(0)=='G'  &&  notas[indice].charAt(1)=='#') return 68;
  if (notas[indice].charAt(0)=='A'  &&  notas[indice].charAt(1)==' ') return 69;
  if (notas[indice].charAt(0)=='A'  &&  notas[indice].charAt(1)=='#') return 70;
  if (notas[indice].charAt(0)=='B'  &&  notas[indice].charAt(1)==' ') return 71;
  else return 0;
  
}

int[] getEscala(){
  int[] miescala=jonico;
  if(notas[indice].charAt(1)==' '){
    if (escalas[indice].charAt(2)=='j') miescala=jonico;
    if (escalas[indice].charAt(2)=='d') miescala=dorico;
    if (escalas[indice].charAt(2)=='f') miescala=frigio;
    if (escalas[indice].charAt(2)=='l') miescala=lidio;
    if (escalas[indice].charAt(2)=='m') miescala=mixolidio;
    if (escalas[indice].charAt(2)=='e') miescala=eolico;
    if (escalas[indice].charAt(2)=='l') miescala=locrio;
  }
  if(notas[indice].charAt(1)=='#'){
    if (escalas[indice].charAt(3)=='j') miescala=jonico;
    if (escalas[indice].charAt(3)=='d') miescala=dorico;
    if (escalas[indice].charAt(3)=='f') miescala=frigio;
    if (escalas[indice].charAt(3)=='l') miescala=lidio;
    if (escalas[indice].charAt(3)=='m') miescala=mixolidio;
    if (escalas[indice].charAt(3)=='e') miescala=eolico;
    if (escalas[indice].charAt(3)=='l') miescala=locrio;
  }
  return miescala;
}




void nextChord(){
  if (indice==notas.length-1) indice=1; else indice++;
}

void prevChord(){
  if (indice==1) indice=notas.length-1; else indice--;
}

*/