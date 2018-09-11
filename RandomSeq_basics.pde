//PrintWriter datos;     
int state = 1;

void setup() {
  //fullScreen(P2D);  
  size(1200,1500,P3D);
  MidiBus.list();
  firstOn=true;
  firstOff=true;
  smooth();
  tempo=300;  
  /*
  seq=  new MidiBus(this, -1, "Klaus_seq");  
  minim=new Minim(this);
  out = minim.getLineOut( Minim.MONO,512,48000,16 ); //minim
  in= minim.getLineIn();
  wave = new Oscil( 440, 0, Waves.SINE );   
  wave.patch(out);
  midi=new Midi2Hz();  
  probabilidad=new int[] {50,0,0,0,50,0,0};
  range=0;
  */
  initializeSeq();
  isLeapMotionActivated=true;
  isMIDIcontrollerActivated=false; 
  
  fondo = loadImage("fondo.jpg");
  ingresarX=displayWidth/4; 
  ingresarY=int(0.6*displayHeight);   
  ingresarSizeX = displayWidth/2;
  ingresarSizeY = displayHeight/9;
  guardarX=displayWidth/4; 
  guardarY=(3*displayHeight)/4;   
  guardarSizeX = displayWidth/2;
  guardarSizeY = displayHeight/9;  
  borrarSizeX = (3*ingresarSizeY)/4;
  borrarSizeY = borrarSizeX;  
  borrarX= ingresarX + ingresarSizeX - borrarSizeX; 
  borrarY= ingresarY - int(1.2*ingresarSizeY);   
  notaCX=displayWidth/14; 
  notaCY=displayHeight/5;   
  notaCSizeX = notaCX;
  notaCSizeY = borrarSizeX;    
  notaCsharpX= notaCX + notaCSizeX; 
  notaCsharpY=notaCY;   
  notaCsharpSizeX = notaCSizeX;
  notaCsharpSizeY = notaCSizeY;
  notaDX=notaCX + 2*notaCSizeX; 
  notaDY= notaCY;   
  notaDSizeX = notaCSizeX;
  notaDSizeY = notaCSizeY;
  notaDsharpX= notaCX + 3*notaCSizeX; 
  notaDsharpY= notaCY;   
  notaDsharpSizeX =  notaCSizeX;
  notaDsharpSizeY = notaCSizeY;  
  notaEX= notaCX + 4*notaCSizeX; 
  notaEY= notaCY;   
  notaESizeX =  notaCSizeX;
  notaESizeY = notaCSizeY;  
  notaFX= notaCX + 5*notaCSizeX; 
  notaFY= notaCY;   
  notaFSizeX =  notaCSizeX;
  notaFSizeY = notaCSizeY;  
  notaFsharpX= notaCX + 6*notaCSizeX; 
  notaFsharpY= notaCY;   
  notaFsharpSizeX =  notaCSizeX;
  notaFsharpSizeY = notaCSizeY;  
  notaGX= notaCX + 7*notaCSizeX; 
  notaGY= notaCY;   
  notaGSizeX =  notaCSizeX;
  notaGSizeY = notaCSizeY;
  notaGsharpX= notaCX + 8*notaCSizeX; 
  notaGsharpY= notaCY;   
  notaGsharpSizeX =  notaCSizeX;
  notaGsharpSizeY = notaCSizeY;  
  notaAX= notaCX + 9*notaCSizeX; 
  notaAY= notaCY;   
  notaASizeX =  notaCSizeX;
  notaASizeY = notaCSizeY; 
  notaAsharpX= notaCX + 10*notaCSizeX; 
  notaAsharpY= notaCY;   
  notaAsharpSizeX =  notaCSizeX;
  notaAsharpSizeY = notaCSizeY;  
  notaBX= notaCX + 11*notaCSizeX; 
  notaBY= notaCY;   
  notaBSizeX =  notaCSizeX;
  notaBSizeY = notaCSizeY; 
  escalaJonicoX= (26*notaCX)/27; 
  escalaJonicoY= notaCY + (4*notaCSizeY)/3;   
  escalaJonicoSizeX =  (displayWidth - 2*notaCSizeX)/7;
  escalaJonicoSizeY = notaCSizeY;  
  escalaDoricoX= escalaJonicoX + escalaJonicoSizeX; 
  escalaDoricoY= escalaJonicoY;   
  escalaDoricoSizeX =  escalaJonicoSizeX;
  escalaDoricoSizeY = escalaJonicoSizeY;  
  escalaFrigioX= escalaJonicoX + 2*escalaJonicoSizeX; 
  escalaFrigioY= escalaJonicoY;   
  escalaFrigioSizeX =  escalaJonicoSizeX;
  escalaFrigioSizeY = escalaJonicoSizeY; 
  escalaLidioX= escalaJonicoX + 3*escalaJonicoSizeX; 
  escalaLidioY= escalaJonicoY;   
  escalaLidioSizeX =  escalaJonicoSizeX;
  escalaLidioSizeY = escalaJonicoSizeY;    
  escalaMixolidioX= escalaJonicoX + 4*escalaJonicoSizeX; 
  escalaMixolidioY= escalaJonicoY;   
  escalaMixolidioSizeX =  escalaJonicoSizeX;
  escalaMixolidioSizeY = escalaJonicoSizeY; 
  escalaEolicoX= escalaJonicoX + 5*escalaJonicoSizeX; 
  escalaEolicoY= escalaJonicoY;   
  escalaEolicoSizeX =  escalaJonicoSizeX;
  escalaEolicoSizeY = escalaJonicoSizeY; 
  escalaLocrioX= escalaJonicoX + 6*escalaJonicoSizeX; 
  escalaLocrioY= escalaJonicoY;   
  escalaLocrioSizeX =  escalaJonicoSizeX;
  escalaLocrioSizeY = escalaJonicoSizeY;  
    
}

void draw(){
  if(state==1){
    ingresarNotas();  
  }  
  if(state==2){
    sequencer();
  // if (notas[indice]==(""+"D")) println("asdasd");
  }
}



boolean over(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed() {
  if (state == 1){
    if(ingresarOver && inputNota != ""){ 
      notas = append(notas,inputNota.substring(0,2));
      escalas = append(escalas, inputNota.substring(2,inputNota.length()));
      inputNota = "";
    }
    if(guardarOver){
      //guardar();
      state = 2;
      
      primera=getTonica()+getEscala()[0]-12;
      tercera=getTonica()+getEscala()[2]-12;
      quinta=getTonica()+getEscala()[4]-12;
      septima=getTonica()+getEscala()[6]-12;

      seq.sendNoteOn(1,primera,100);
      seq.sendNoteOn(1,tercera,100);
      seq.sendNoteOn(1,quinta,100);
      seq.sendNoteOn(1,septima,50);
      
      
      
    }
    if(borrarOver){
      inputNota = borrar1caracter(inputNota);
    }
    if(notaCOver){
      inputNota = inputNota+"C";
    }
    if(notaCsharpOver){
      inputNota = inputNota+"C#";
    }  
    if(notaDOver){
      inputNota = inputNota+"D";
    }  
    if(notaDsharpOver){
      inputNota = inputNota+"D#";
    }  
    if(notaEOver){
      inputNota = inputNota+"E";
    }  
    if(notaFOver){
      inputNota = inputNota+"F";
    }  
    if(notaFsharpOver){
      inputNota = inputNota+"F#";
    }  
    if(notaGOver){
      inputNota = inputNota+"G";
    }  
    if(notaGsharpOver){
      inputNota = inputNota+"G#";
    }  
    if(notaAOver){
      inputNota = inputNota+"A";
    }  
    if(notaAsharpOver){
      inputNota = inputNota+"A#";
    }  
    if(notaBOver){
      inputNota = inputNota+"B";
    }  
    if(escalaJonicoOver){
      inputNota = inputNota+" jonico";
    }  
    if(escalaDoricoOver){
      inputNota = inputNota+" dorico";
    }  
    if(escalaFrigioOver){
      inputNota = inputNota+" frigio";
    }    
    if(escalaLidioOver){
      inputNota = inputNota+" lidio";
    }    
    if(escalaMixolidioOver){
      inputNota = inputNota+" mixolidio";
    }    
    if(escalaEolicoOver){
      inputNota = inputNota+" eolico";
    }    
    if(escalaLocrioOver){
      inputNota = inputNota+" locrio";
    }    
  }
  if (state == 2  &&  mouseX<displayWidth/4  &&  mouseY<displayHeight/4){    //Volver al menu principal cuando se
    state = 1;                                                             //hace click en la esquina superior izquierda
    //wave.setAmplitude(0);
  } else {
    //...    
  }
}

void keyPressed(){
  if ((key>=48 && key<=57) || (key>=65 && key<=90)  ||  (key>=97 && key<=122) || key==35 || key == 32){
    inputNota = inputNota+key;
    //if(key=='C')         println("flag");

  }
  if (key == 8){
    inputNota = borrar1caracter(inputNota);
  }
  if (keyCode == ENTER && inputNota != ""){
    //notas  =  append(notas, inputNota);
    notas = append(notas,inputNota.substring(0,2));
    escalas = append(escalas, inputNota.substring(1,inputNota.length()));
    inputNota = "";
  }
  if (keyCode == TAB){
    //guardar();
    state = 2;
  }  
  
  
  if (key=='k') {
    nextChord(); 
   seq.sendNoteOff(1,primera,100);
   seq.sendNoteOff(1,tercera,100);
   seq.sendNoteOff(1,quinta,100);
   seq.sendNoteOff(1,septima,50); 
 
 
   primera=getTonica()+getEscala()[0]-12;
   tercera=getTonica()+getEscala()[2]-12;
   quinta=getTonica()+getEscala()[4]-12;
   septima=getTonica()+getEscala()[6]-12;

   seq.sendNoteOn(1,primera,100);
   seq.sendNoteOn(1,tercera,100);
   seq.sendNoteOn(1,quinta,100);
   seq.sendNoteOn(1,septima,50);
    
    
  }
  if (key=='j') {
    prevChord();
  
   seq.sendNoteOff(1,primera,100);
   seq.sendNoteOff(1,tercera,100);
   seq.sendNoteOff(1,quinta,100);
   seq.sendNoteOff(1,septima,50); 
 
 
   primera=getTonica()+getEscala()[0]-12;
   tercera=getTonica()+getEscala()[2]-12;
   quinta=getTonica()+getEscala()[4]-12;
   septima=getTonica()+getEscala()[6]-12;

   seq.sendNoteOn(1,primera,100);
   seq.sendNoteOn(1,tercera,100);
   seq.sendNoteOn(1,quinta,100);
   seq.sendNoteOn(1,septima,50);
    
  }
}

/*
void onleapswipe{
2
  mover indice
 
 seq.sendNoteOff(1,primera,100);
 seq.sendNoteOff(1,tercera,100);
 seq.sendNoteOff(1,quinta,100);
 seq.sendNoteOff(1,septima,50); 
 
 
 primera=getTonica()+getEscala()[0]-12;
 tercera=getTonica()+getEscala()[2]-12;
 quinta=getTonica()+getEscala()[4]-12;
 septima=getTonica()+getEscala()[6]-12;

 seq.sendNoteOn(1,primera,100);
 seq.sendNoteOn(1,tercera,100);
 seq.sendNoteOn(1,quinta,100);
 seq.sendNoteOn(1,septima,50);
 
  
}

*/

/*

void setup(){
 size(600,600);
 smooth();
 background(0);
 
 initializeSeq();
 isLeapMotionActivated=true;
 isMIDIcontrollerActivated=false; 
  
}

void draw(){
  sequencer();

  
}

*/