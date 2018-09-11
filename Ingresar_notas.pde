PImage fondo; 
color buttonColor = color(240);
color buttonHighlight = color(200); 
String[] notas = {""};
String[] escalas = {""};
String inputNota = "";

int ingresarX, ingresarY;
int ingresarSizeX, ingresarSizeY;
int guardarX, guardarY; 
int guardarSizeX, guardarSizeY;
int borrarX, borrarY;
int borrarSizeX, borrarSizeY;
int notaCX, notaCY;       
int notaCSizeX, notaCSizeY;   
int notaCsharpX, notaCsharpY;          
int notaCsharpSizeX, notaCsharpSizeY; 
int notaDX, notaDY;          
int notaDSizeX, notaDSizeY; 
int notaDsharpX, notaDsharpY;          
int notaDsharpSizeX, notaDsharpSizeY; 
int notaEX, notaEY;          
int notaESizeX, notaESizeY; 
int notaFX, notaFY;          
int notaFSizeX, notaFSizeY; 
int notaFsharpX, notaFsharpY;          
int notaFsharpSizeX, notaFsharpSizeY; 
int notaGX, notaGY;          
int notaGSizeX, notaGSizeY; 
int notaGsharpX, notaGsharpY;          
int notaGsharpSizeX, notaGsharpSizeY; 
int notaAX, notaAY;          
int notaASizeX, notaASizeY; 
int notaAsharpX, notaAsharpY;          
int notaAsharpSizeX, notaAsharpSizeY; 
int notaBX, notaBY;          
int notaBSizeX, notaBSizeY; 
int escalaJonicoX, escalaJonicoY;          
int escalaJonicoSizeX, escalaJonicoSizeY; 
int escalaDoricoX, escalaDoricoY;          
int escalaDoricoSizeX, escalaDoricoSizeY; 
int escalaFrigioX, escalaFrigioY;          
int escalaFrigioSizeX, escalaFrigioSizeY; 
int escalaLidioX, escalaLidioY;          
int escalaLidioSizeX, escalaLidioSizeY; 
int escalaMixolidioX, escalaMixolidioY;          
int escalaMixolidioSizeX, escalaMixolidioSizeY; 
int escalaEolicoX, escalaEolicoY;          
int escalaEolicoSizeX, escalaEolicoSizeY; 
int escalaLocrioX, escalaLocrioY;          
int escalaLocrioSizeX, escalaLocrioSizeY; 
boolean ingresarOver = false;
boolean guardarOver = false;
boolean borrarOver = false;
boolean notaCOver = false;
boolean notaCsharpOver = false;
boolean notaDOver = false;
boolean notaDsharpOver = false;
boolean notaEOver = false;
boolean notaFOver = false;
boolean notaFsharpOver = false;
boolean notaGOver = false;
boolean notaGsharpOver = false;
boolean notaAOver = false;
boolean notaAsharpOver = false;
boolean notaBOver = false;
boolean escalaJonicoOver = false;
boolean escalaDoricoOver = false;
boolean escalaFrigioOver = false;
boolean escalaLidioOver = false;
boolean escalaMixolidioOver = false;
boolean escalaEolicoOver = false;
boolean escalaLocrioOver = false;

void ingresarNotas(){  
  image(fondo, 0,0,displayWidth,displayHeight);
  strokeWeight(1);  
  updateIngresar(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
  if (ingresarOver) {
    fill(buttonHighlight,100);
  } else {
    fill(buttonColor,100);
  }
  stroke(150);
  rect(ingresarX, ingresarY, ingresarSizeX, ingresarSizeY);    

  updateGuardar(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
  if (guardarOver) {
    fill(buttonHighlight,100);
  } else {
    fill(buttonColor,50);
  }
  stroke(150);
  rect(guardarX, guardarY, guardarSizeX, guardarSizeY);    

  updateBorrar(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
  if (borrarOver) {
    fill(buttonHighlight,70);
  } else {
    fill(buttonColor,30);
  }
  stroke(150);
  rect(borrarX, borrarY, borrarSizeX, borrarSizeY);   
  
  updateNotaC(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
  if (notaCOver) {
    fill(buttonHighlight,100);
  } else {
    fill(buttonColor,100);
  }
  stroke(150);
  strokeWeight(2);
  rect(notaCX, notaCY, notaCSizeX, notaCSizeY);  
  updateNotaCsharp(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    
    if (notaCsharpOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaCsharpX, notaCsharpY, notaCsharpSizeX, notaCsharpSizeY);     
  
    updatenotaD(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaDOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaDX, notaDY, notaDSizeX, notaDSizeY); 
    
    updatenotaDsharp(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaDsharpOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaDsharpX, notaDsharpY, notaDsharpSizeX, notaDsharpSizeY);

    updatenotaE(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaEOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaEX, notaEY, notaESizeX, notaESizeY);   

    updatenotaF(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaFOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaFX, notaFY, notaFSizeX, notaFSizeY);   

    updatenotaFsharp(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaFsharpOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaFsharpX, notaFsharpY, notaFsharpSizeX, notaFsharpSizeY); 
    
     updatenotaG(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaGOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaGX, notaGY, notaGSizeX, notaGSizeY);     
    
    updatenotaGsharp(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaGsharpOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaGsharpX, notaGsharpY, notaGsharpSizeX, notaGsharpSizeY);  
    
    updatenotaA(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaAOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaAX, notaAY, notaASizeX, notaASizeY); 

    updatenotaAsharp(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaAsharpOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaAsharpX, notaAsharpY, notaAsharpSizeX, notaAsharpSizeY);         
    
    updatenotaB(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (notaBOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(notaBX, notaBY, notaBSizeX, notaBSizeY); 

    updateescalaJonico(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (escalaJonicoOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(escalaJonicoX, escalaJonicoY, escalaJonicoSizeX, escalaJonicoSizeY);         

    updateescalaDorico(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (escalaDoricoOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(escalaDoricoX, escalaDoricoY, escalaDoricoSizeX, escalaDoricoSizeY); 

    updateescalaFrigio(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (escalaFrigioOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(escalaFrigioX, escalaFrigioY, escalaFrigioSizeX, escalaFrigioSizeY);       

    updateescalaLidio(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (escalaLidioOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(escalaLidioX, escalaLidioY, escalaLidioSizeX, escalaLidioSizeY);     

    updateescalaMixolidio(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (escalaMixolidioOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(escalaMixolidioX, escalaMixolidioY, escalaMixolidioSizeX, escalaMixolidioSizeY);    
    
    updateescalaEolico(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (escalaEolicoOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(escalaEolicoX, escalaEolicoY, escalaEolicoSizeX, escalaEolicoSizeY);   

    updateescalaLocrio(mouseX, mouseY); //Por si el mouse esta por encima del boton graficar
    if (escalaLocrioOver) {
      fill(buttonHighlight,100);
    } else {
      fill(buttonColor,100);
    }
    stroke(150);
    strokeWeight(2);
    rect(escalaLocrioX, escalaLocrioY, escalaLocrioSizeX, escalaLocrioSizeY);     
    
  fill(160,160,255);
  textSize(displayWidth/30);
  textAlign(CENTER);
  text("Ingrese una nota y un modo:", displayWidth/2, displayHeight/8);
  fill(200,200,255);
  textSize(displayWidth/25);
  text(inputNota, displayWidth/2, int(0.53*displayHeight));    
  textSize(displayWidth/35);
  fill(20,20,100,120);
  text("Guardar acorde", ingresarX + ingresarSizeX/2, ingresarY + (2*ingresarSizeY)/3);
  text("Almacenar en archivo", guardarX + guardarSizeX/2, guardarY + (2*guardarSizeY)/3);
  text("<", borrarX + borrarSizeX/2,borrarY + (2*borrarSizeY)/3);
  textSize(displayWidth/40);  
  text("(Notas guardadas: "+(notas.length-1)+")", (3*displayWidth)/4, (10*displayHeight)/11);
  textSize(displayWidth/40);
  fill(20,20,100,120);
  text("C", notaCX + notaCSizeX/2, notaCY + (2*notaCSizeY)/3);  
  text("C#", notaCX + (3*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("D", notaCX + (5*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("D#", notaCX + (7*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("E", notaCX + (9*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("F", notaCX + (11*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("F#", notaCX + (13*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("G", notaCX + (15*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("G#", notaCX + (17*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("A", notaCX + (19*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("A#", notaCX + (21*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);  
  text("B", notaCX + (23*notaCSizeX)/2, notaCY + (2*notaCSizeY)/3);    
  text("Jonico", escalaJonicoX + (escalaJonicoSizeX)/2, escalaJonicoY + (2*escalaJonicoSizeY)/3);  
  text("Dorico", escalaJonicoX + (3*escalaJonicoSizeX)/2, escalaJonicoY + (2*escalaJonicoSizeY)/3);  
  text("Frigio", escalaJonicoX + (5*escalaJonicoSizeX)/2, escalaJonicoY + (2*escalaJonicoSizeY)/3);  
  text("Lidio", escalaJonicoX + (7*escalaJonicoSizeX)/2, escalaJonicoY + (2*escalaJonicoSizeY)/3);  
  text("Mixolidio", escalaJonicoX + (9*escalaJonicoSizeX)/2, escalaJonicoY + (2*escalaJonicoSizeY)/3);  
  text("Eolico", escalaJonicoX + (11*escalaJonicoSizeX)/2, escalaJonicoY + (2*escalaJonicoSizeY)/3);  
  text("Locrio", escalaJonicoX + (13*escalaJonicoSizeX)/2, escalaJonicoY + (2*escalaJonicoSizeY)/3);  
}

void updateIngresar(int x, int y) {
  if ( over(ingresarX, ingresarY, ingresarSizeX, ingresarSizeY) ) {
    ingresarOver = true;
  }
  else {
      ingresarOver = false;
  }
}

void updateGuardar(int x, int y) {
  if ( over(guardarX, guardarY, guardarSizeX, guardarSizeY) ) {
    guardarOver = true;
  }
  else {
    guardarOver = false;
  }
}

void updateBorrar(int x, int y) {
  if ( over(borrarX, borrarY, borrarSizeX, borrarSizeY) ) {
    borrarOver = true;
  }
  else {
    borrarOver = false;
  }
}

void updateNotaC(int x, int y) {
  if ( over(notaCX, notaCY, notaCSizeX, notaCSizeY) ) {
    notaCOver = true;
  }
  else {
    notaCOver = false;
  }
}

void updateNotaCsharp(int x, int y) {
  if ( over(notaCsharpX, notaCsharpY, notaCsharpSizeX, notaCsharpSizeY) ) {
    notaCsharpOver = true;
  }
  else {
    notaCsharpOver = false;
  }
}

void updatenotaD(int x, int y) {
  if ( over(notaDX, notaDY, notaDSizeX, notaDSizeY) ) {
    notaDOver = true;
  }
  else {
    notaDOver = false;
  }
}
  
void updatenotaDsharp(int x, int y) {
  if ( over(notaDsharpX, notaDsharpY, notaDsharpSizeX, notaDsharpSizeY) ) {
    notaDsharpOver = true;
  }
  else {
    notaDsharpOver = false;
  }
}

void updatenotaE(int x, int y) {
  if ( over(notaEX, notaEY, notaESizeX, notaESizeY) ) {
    notaEOver = true;
  }
  else {
    notaEOver = false;
  }
}

void updatenotaF(int x, int y) {
  if ( over(notaFX, notaFY, notaFSizeX, notaFSizeY) ) {
    notaFOver = true;
  }
  else {
    notaFOver = false;
  }
}

void updatenotaFsharp(int x, int y) {
  if ( over(notaFsharpX, notaFsharpY, notaFsharpSizeX, notaFsharpSizeY) ) {
    notaFsharpOver = true;
  }
  else {
    notaFsharpOver = false;
  }
}

void updatenotaG(int x, int y) {
  if ( over(notaGX, notaGY, notaGSizeX, notaGSizeY) ) {
    notaGOver = true;
  }
  else {
    notaGOver = false;
  }
}

void updatenotaGsharp(int x, int y) {
  if ( over(notaGsharpX, notaGsharpY, notaGsharpSizeX, notaGsharpSizeY) ) {
    notaGsharpOver = true;
  }
  else {
    notaGsharpOver = false;
  }
}


void updatenotaA(int x, int y) {
  if ( over(notaAX, notaAY, notaASizeX, notaASizeY) ) {
    notaAOver = true;
  }
  else {
    notaAOver = false;
  }
}

void updatenotaAsharp(int x, int y) {
  if ( over(notaAsharpX, notaAsharpY, notaAsharpSizeX, notaAsharpSizeY) ) {
    notaAsharpOver = true;
  }
  else {
    notaAsharpOver = false;
  }
}


void updatenotaB(int x, int y) {
  if ( over(notaBX, notaBY, notaBSizeX, notaBSizeY) ) {
    notaBOver = true;
  }
  else {
    notaBOver = false;
  }
}
  
void updateescalaJonico(int x, int y) {
  if ( over(escalaJonicoX, escalaJonicoY, escalaJonicoSizeX, escalaJonicoSizeY) ) {
    escalaJonicoOver = true;
  }
  else {
    escalaJonicoOver = false;
  }
}  

void updateescalaDorico(int x, int y) {
  if ( over(escalaDoricoX, escalaDoricoY, escalaDoricoSizeX, escalaDoricoSizeY) ) {
    escalaDoricoOver = true;
  }
  else {
    escalaDoricoOver = false;
  }
}

void updateescalaFrigio(int x, int y) {
  if ( over(escalaFrigioX, escalaFrigioY, escalaFrigioSizeX, escalaFrigioSizeY) ) {
    escalaFrigioOver = true;
  }
  else {
    escalaFrigioOver = false;
  }
}
  
void updateescalaLidio(int x, int y) {
  if ( over(escalaLidioX, escalaLidioY, escalaLidioSizeX, escalaLidioSizeY) ) {
    escalaLidioOver = true;
  }
  else {
    escalaLidioOver = false;
  }
}
  
void updateescalaMixolidio(int x, int y) {
  if ( over(escalaMixolidioX, escalaMixolidioY, escalaMixolidioSizeX, escalaMixolidioSizeY) ) {
    escalaMixolidioOver = true;
  }
  else {
    escalaMixolidioOver = false;
  }
}

void updateescalaEolico(int x, int y) {
  if ( over(escalaEolicoX, escalaEolicoY, escalaEolicoSizeX, escalaEolicoSizeY) ) {
    escalaEolicoOver = true;
  }
  else {
    escalaEolicoOver = false;
  }
}

void updateescalaLocrio(int x, int y) {
  if ( over(escalaLocrioX, escalaLocrioY, escalaLocrioSizeX, escalaLocrioSizeY) ) {
    escalaLocrioOver = true;
  }
  else {
    escalaLocrioOver = false;
  }
}
  
void guardar(){
/*  datos = createWriter("Notas.txt");  
  for(int i = 1; i < notas.length; i++){  
    datos.print(notas[i]); 
    datos.print("\t");  
  }
  datos.flush(); //Escribe los datos remanentes
  datos.close(); //Termina el archivo 
  notas = new String[0];
  notas = append(notas, "");
  */
}

String borrar1caracter(String palabra){
  if (palabra.length() != 0){
    palabra = palabra.substring(0,palabra.length()-1);  
    return palabra;
  }else return "";
}