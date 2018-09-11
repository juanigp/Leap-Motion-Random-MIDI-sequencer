import de.voidplus.leapmotion.*;

LeapMotion leap;



int angle() {

  Hand left_hand = null, right_hand = null;
  
  // Detectamos las manos
  for (Hand hand : leap.getHands()) {
    if (hand.isLeft())
      left_hand = hand;
    else if (hand.isRight())
      right_hand = hand;
  }  

  // Calculamos el ángulo entre las dos
  if (left_hand != null && right_hand != null) {
    //println(degrees(PVector.angleBetween(left_hand.getPosition(),right_hand.getPosition()))); // Esto no anda muy bien al parecer
    return int((degrees(atan2(abs(left_hand.getPosition().y - right_hand.getPosition().y), abs(left_hand.getPosition().x - right_hand.getPosition().x))))); // Oldschool
  } else return 0;
}


float fingerdist(String dedo, String mano){    //distancia entre pulgar y dedo ingresado          
                          
  Finger thumb,finger; 
  PVector distancia, thumb_pos, finger_pos;
  
  finger_pos= new PVector(0,0,0); //inicializacion de finger_pos
  thumb_pos= new PVector(0,0,0); //inicializacion de thumb_pos  
  
  for (Hand hand : leap.getHands()) {
    finger=hand.getIndexFinger(); //inicializacion de finger
    
      if(hand.isRight() && mano == "derecha"){                        
  
      thumb    = hand.getThumb(); ///--- 
      thumb_pos = thumb.getPosition();
    
      if (dedo == "thumb") {
        finger     = hand.getThumb();    
      }
      if (dedo == "index") {
        finger     = hand.getIndexFinger();    
      }  
      if (dedo == "middle") {
        finger    = hand.getMiddleFinger();    
      }  
      if (dedo == "ring") {
        finger      = hand.getRingFinger();    
      }  
      if (dedo == "pink") {
        finger      = hand.getPinkyFinger();    
      } 
      
      finger_pos=finger.getPosition();

      }
      
      if(hand.isLeft() && mano == "izquierda"){                        
  
      thumb    = hand.getThumb(); ///--- 
      thumb_pos = thumb.getPosition();
    
      if (dedo == "thumb") {
        finger     = hand.getThumb();    
      }
      if (dedo == "index") {
        finger     = hand.getIndexFinger();    
      }  
      if (dedo == "middle") {
        finger    = hand.getMiddleFinger();    
      }  
      if (dedo == "ring") {
        finger      = hand.getRingFinger();    
      }  
      if (dedo == "pink") {
        finger      = hand.getPinkyFinger();    
      } 
      
      finger_pos=finger.getPosition();

      }      
  }
 
  distancia=PVector.sub(thumb_pos,finger_pos);
 // println(distancia.mag());
//  if (distancia.mag()>25) return 1;
//  else if (distancia.mag()<3) return 0;
   return (distancia.mag()); 

  
}


float handdist(){                        //distancia entre las manos
  PVector posr,posl,dist;
  posr= new PVector (0,0,0);
  posl= new PVector (0,0,0);
  for (Hand hand : leap.getHands()) {
   // println(hand.getId());
   //println((leap.getHands()).length);
    if (hand.isRight() ) posr=hand.getPosition();
    if (hand.isLeft() ) posl=hand.getPosition();    
  }
  
  dist=PVector.sub(posl,posr);
  if (dist.mag()>=1250) return 1250;
  else return (dist.mag());
}

PVector midvec(){                      //punto medio entre las manos
  PVector posr,posl,midvec;
  posr= new PVector (0,0,0);
  posl= new PVector (0,0,0);
  for (Hand hand : leap.getHands ()) {
    if (hand.isRight() ) posr=hand.getPosition();
    if (hand.isLeft() ) posl=hand.getPosition();    
  }
    
    midvec=PVector.add(posl,posr);
   // println(midvec.y);
    return PVector.div(midvec,2);
}


void cchange(float valor, int cc, MidiBus midibus){    // mandar cc midi ,  0<valor<1
  //println(valor);
  midibus.sendControllerChange(0,cc,int(valor));
}
  

int cchangeprueba(float cc){
  cc= int(cc);
  return int(cc);
}



/*
void leapOnSwipeGesture(SwipeGesture g, int state){      //cambio de acorde haciendo swipe
 if (state==3){
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
}*/
  