
void controllerChange(int channel, int number, int value) {  //mapeos midi

  if (isMIDIcontrollerActivated) {
    if (number==0) {
      tempo=value*3; 
      println(tempo);
    }
    if (number==1) {
      if (value<40) range=0;
      if ( (value>40)&&(value<80) ) range=3;
      if ( (value>80)&&(value<127) ) range=5;
    }
    if (number==2) {
      if (value<20) probabilidad=new int[] {50, 0, 0, 0, 50, 0, 0};
      if ( (value>20)&&(value<40) ) probabilidad=new int[] {33, 0, 33, 0, 33, 0, 0};
      if ( (value>40)&&(value<60) ) probabilidad=new int[] {30, 0, 30, 0, 30, 0, 10};
      if ( (value>60)&&(value<80) ) probabilidad=new int[] {20, 10, 20, 0, 20, 10, 20};
      if ( (value>80)&&(value<=100) ) probabilidad=new int[] {20, 7, 20, 6, 20, 7, 20};
    }
    if (number==3) {
      dur=value/15 +1.1;
    }
  }



}