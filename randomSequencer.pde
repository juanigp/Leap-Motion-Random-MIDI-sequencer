/*
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
*/

import themidibus.*;
import java.util.Random;


MidiBus seq;
/*
Minim minim;
Oscil wave;        //minim
AudioOutput out;
AudioInput in;
Midi2Hz midi;
*/
boolean isLeapMotionActivated;
boolean isMIDIcontrollerActivated;

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




  
int primera, tercera, quinta, septima;

int C=60,Csharp=61, D=62,Dsharp=63, E=64, F=65,Fsharp=66, G=67,Gsharp=68, A=69,Asharp=70, B=71;


int[] miprogresion= {60,65,62,67};                                  //ejemplo
int[][] misescalas= new int[][] {jonico,lidio,dorico,mixolidio};
float dur;


int indice=1,lastIndice=0;                                                                       //indice = 2, en este caso estas sobre  D dorico
//String[] notas = {"C ","F ","D ","G "};                                                          //inicializo el ejemplo!!!!!!
//String[] escalas = {"  j","  L","  d","  m"};


///////////////////////////////////////////////////////////////////////////////////


void siguiente(){
  if (indice!=progLength-1) indice++; else if (indice==progLength-1) indice=0; 
}

void anterior(){
  if (indice!=0) indice--;
}

void sequencer(){

  background(0);
  
 // writeLabel(notas,escalas,indice);

/*
  for (int i = 0; i < in.bufferSize() - 1; i++)
  {
    line( i*(displayWidth/out.bufferSize()), displayHeight/2 + in.left.get(i)*100, (i+1)*(displayWidth/out.bufferSize()), displayHeight/2 + in.left.get(i+1)*100 );
    line( i*(displayWidth/out.bufferSize()), displayHeight/2 + in.right.get(i)*100, (i+1)*(displayWidth/out.bufferSize()), displayHeight/2 + in.right.get(i+1)*100 );    
  }  
  
  
  
  */
  
  

 
 
  //nueva nota para mi progresion 
 int rand=int ( random(100) ), probAcu=0, offset=12;


 for (int i=0;i<=6;i++){
   if ( (rand>=probAcu)&&(rand<=probabilidad[i]+probAcu)) {rand=i;break;} else probAcu=probAcu+probabilidad[i];
 }
   /*
   if (indice!=progLength-1){
     if (abs(miprogresion[indice]-miprogresion[indice+1])>5) offset=0; }
     else if (abs(miprogresion[indice]-miprogresion[0])>5) offset=0;
     
     */
     
   

// int newNote=miprogresion[indice]+ misescalas[indice][ rand]+offset+rangeArray[int(random(range))] ;
 int newNote=newRandomNote(rand)+offset;
 
  //println(newNote);
   if (millis() <= lastMillis + tempo) { 
     if (firstOn==true){
       seq.sendNoteOn(0,newNote,100);
       /*
       midi.setMidiNoteIn(newNote);
       midi.patch(wave.frequency);        //minim
       wave.setAmplitude(1);                                                                          // si le pones 0 minim se calla
       */
       lastNote=newNote;
       firstOn=false;
     }
     if (millis() >= lastMillis + tempo/dur){
       if (firstOff==true){
         seq.sendNoteOff(0,lastNote,100);
         
         //wave.setAmplitude(0);      //minim
         
         firstOff=false;
     }  
   }


  } 
  else if (millis() >= lastMillis + tempo) {
    lastMillis = millis();
    firstOn=true;
    firstOff=true;
  }
  
  if (isLeapMotionActivated){
 // if (int(handdist())!=0) {
  tempo=int(handdist()
  
  );   //quitar comentario para usar con leapMotion
   
  /*
    if (fingerdist("index","izquierda")<80) range=0;
    else if ( (fingerdist("index","izquierda")>80)&&(fingerdist("index","izquierda")<120) ) range=3;
    else range=5;
    
    changeVar();
    dur=midvec().y/100;  
    cchange( fingerdist("middle","izquierda"), 16, seq);   //mandar MIDI a Ableton 
    cchange( fingerdist("middle","derecha"), 17, seq);   //mandar MIDI a Ableton    
    cchange( fingerdist("ring","izquierda"), 18, seq);   //mandar MIDI a Ableton 
    cchange(127- angle(), 19, seq);   //mandar MIDI a Ableton     
   // println(angle());
    */
    
  //} 
  }
}
  
int newRandomNote(int randomNum){
  int newNote=0; 
  
  newNote=getTonica();    
  newNote=newNote+getEscala()[randomNum]; 
  
  newNote=newNote+rangeArray[int(random(range))] ;
//  println(notas.length);

 // delay(12222);

  //if (notas[indice]=="C ") println("aa");
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
    if (escalas[indice].charAt(2)=='L') miescala=lidio;
    if (escalas[indice].charAt(2)=='m') miescala=mixolidio;
    if (escalas[indice].charAt(2)=='e') miescala=eolico;
    if (escalas[indice].charAt(2)=='l') miescala=locrio;
  }
  if(notas[indice].charAt(1)=='#'){
    if (escalas[indice].charAt(3)=='j') miescala=jonico;
    if (escalas[indice].charAt(3)=='d') miescala=dorico;
    if (escalas[indice].charAt(3)=='f') miescala=frigio;
    if (escalas[indice].charAt(3)=='L') miescala=lidio;
    if (escalas[indice].charAt(3)=='m') miescala=mixolidio;
    if (escalas[indice].charAt(3)=='e') miescala=eolico;
    if (escalas[indice].charAt(3)=='l') miescala=locrio;
  }
  return miescala;
}


void nextChord(){
  if (indice==notas.length-1) indice=0; else indice++;
}

void prevChord(){
  if (indice==0) indice=notas.length-1; else indice--;
}

void changeVar(){
  var= int(fingerdist("indice","derecha"));   //cambiar la variacion con la distancia entre el indice y el pulgar( MANO DERECHA!!!!)
 
  if (var<50) probabilidad=new int[] {50,0,0,0,50,0,0};                             //probabilidad de que nota va a ser disparada
  else if ( (var>50)&&(var<70) ) probabilidad=new int[] {33,0,33,0,33,0,0};
  else if ( (var>70)&&(var<90) ) probabilidad=new int[] {30,0,30,0,30,0,10};
  else if ( (var>90)&&(var<110) ) probabilidad=new int[] {20,10,20,0,20,10,20};
  else  probabilidad=new int[] {20,7,20,6,20,7,20};
  
}

void initializeSeq(){                                                                              //inicializa variables, minim y the midi bus
  firstOn=true;
  firstOff=true;
  smooth();
  tempo=300;  
  leap= new LeapMotion(this).allowGestures();
  if (isMIDIcontrollerActivated) 
    seq=  new MidiBus(this, "nanoKONTROL2", "Klaus_seq"); 
  else if (isLeapMotionActivated)
    seq=  new MidiBus(this, -1, "Klaus_seq"); 
  seq=  new MidiBus(this, "nanoKONTROL2", "Klaus_seq");  
  /*
  minim=new Minim(this);
  out = minim.getLineOut( Minim.MONO,512,48000,16 ); //minim
  in= minim.getLineIn();
  wave = new Oscil( 440, 0, Waves.SINE );   
  //wave.patch(out);      //sonido minim
  midi=new Midi2Hz();  
  */
  probabilidad=new int[] {50,0,0,0,50,0,0};
  range=0; 
  
}