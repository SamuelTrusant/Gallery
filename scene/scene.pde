//medidas sala
float wall = 2000;
float roof = 600;
float bottom = 2000;
float centerSize = 800;
boolean lightsOff = false;

//posición camara
float camHeight = 170;
float[] camPos = {wall -600, 0, 0};
float[] dirPos = {1,0,0};
float[] sideDir = {0,0,-1};
float distanceMinWall = 80;
boolean w,a,s,d = false;
float speed = 8;

//objetos escena
PShape galery,jupiter,tanque,david;
PImage grito,gioconda,jupiterT,pared,madera,mar,selva,lava;

//movimiento júpiter
float jupiterSpeed = 5;
float jupiterr = 200;

void setup(){
  size(1200 , 600 ,P3D);
  noStroke();
  grito = loadImage("Textures/grito.jpg");
  gioconda = loadImage("Textures/gioconda.jpg");
  jupiterT = loadImage("Textures/jupiter.jpg");
  pared = loadImage("Textures/paredBlanca.jpg");
  david = loadShape("Textures/david.obj");
  madera = loadImage("Textures/madera.jpg");
  mar = loadImage("Textures/mar.jpg");
  selva = loadImage("Textures/selva.jpg");
  lava = loadImage("Textures/lava.png");
  
  beginShape();
  jupiter = createShape (SPHERE,jupiterr);
  jupiter.setStroke(255);
  jupiter.setTexture(jupiterT);
  endShape (CLOSE) ;
  /*
  stroke(0);
  beginShape ( ) ;
  galery = createShape (SPHERE,sunr);
  galery.setStroke(255);
  galery.setTexture(img);
  endShape (CLOSE) ;
  */
}

void draw ( ) {
    
  background( 0 ) ;
  
  camera(camPos[0], camPos[1], camPos[2], camPos[0] + dirPos[0], camPos[1] + dirPos[1], camPos[2] + dirPos[2], 0, 1, 0); 
  
  //spotLight(250, 250, 250, wall - 150, -tall/2, bottom -150, 0,1,0,90, 600);

  //lights();
  //directionalLight(51, 102, 126, 0, 0, 1);
  //spotLight(51, 102, 250, wall - 100, 0, bottom - 100, 1, 0, 0, PI/2, 1);
  ambientLight(50, 50, 50);

  if(!lightsOff){
    //ambientLight(50, 50, 50);
    ambientLight(150, 150, 150);

    /*
    //ESTA ES LA OPCIÓN BUENA, CON SOLO DOS PUNTOS OPUESTOS
    spotLight(100, 100, 100, 0, 0, 0, 1, 0, 0, PI/2, 1);
    spotLight(100, 100, 100, 0, 0, 0, -1, 0, 0, PI/2, 1);
    spotLight(100, 100, 100, 0, 0, 0, 0, 0, -1, PI/2, 1);
    spotLight(100, 100, 100, 0, 0, 0, 0, 0, 1, PI/2, 1);
    */
    //pointLight(80, 80, 80, wall + 150, 0, bottom - 150);
    //pointLight(80, 80, 80, -wall + 150, 0, bottom - 150);
    //pointLight(80, 80,80, -wall + 150, 0, -bottom + 150);
    //pointLight(80, 80, 80, wall - 150, 0, -bottom + 150);

  } else {
    spotLight(51, 106, 146, 0, 0, 0, 1, 0, 0, PI/2, 3);
    spotLight(51, 122, 56, 0, 0, 0, 0, 0, 1, PI/2, 3);
    spotLight(141, 52, 106, 0, 0, 0, 0, 0, -1, PI/2, 3);
  }


  createRoom(wall,roof,bottom, 0, camHeight - roof/2, 0, pared);
  createRoom(centerSize,roof,centerSize,0, -100, 0, pared);

  pushMatrix();
  translate(wall-0.1,0,0);
  rotateY(radians(-90));
    textSize(30);
    textAlign(CENTER);
    //fill(50);
    text("Bienvenido a la galería.\nPara moverte, usa las teclas 'w' 'a' 's' 'd'.\nPara mover la camara mantén pulsado cualquier botón del ratón y arrastra.", 0, 0, 0);
  popMatrix();
  
  pushMatrix();
  translate(0,0,wall-0.1);
  rotateY(radians(180));
    textSize(30);
    textAlign(CENTER);
    //fill(50);
    text("pulsa 'l' para apagar las luces.", 0, 0, 0);
  popMatrix();

  /*
  pushMatrix();
    //emissive(200, 200, 200);
    shininess(100);
    translate(0, camHeight - tall/2,0);
    texture(paredBlanca);
    box(wall*2, tall, bottom*2);
  popMatrix();
  */
  //pointLight(255, 255, 255, -wall+0.1,0,0);

  pushMatrix();
  //spotLight(255, 255, 255, -wall + 50 ,160,0, -0.5, 0.5, 0, 90, 1);

  translate(-wall+0.1,0,0);
  rotateY(radians(90));
    stroke(0);
    textureMode(NORMAL);
    //shininess(100);

    beginShape();
    texture(grito);
    vertex(-150, -200, 0, 0, 0);
    vertex(150, -200, 0, 1, 0);
    vertex(150, 200, 0, 1, 1);
    vertex(-150, 200, 0, 0, 1);
    endShape ( ) ;
  popMatrix();
  
  pushMatrix();
  translate(0,-50,-bottom+0.1);
    stroke(0);
    textureMode(NORMAL);
    //shininess(100);

    beginShape();
    texture(gioconda);
    vertex(-100, -100, 0, 0, 0);
    vertex(100, -100, 0, 1, 0);
    vertex(100, 100, 0, 1, 1);
    vertex(-100, 100, 0, 0, 1);
    endShape();
  popMatrix();

/*
  pushMatrix();
    rotateX(radians(360*mouseX/width));
    rotateY(radians(360*mouseY/height));
    textureMode(NORMAL) ;
    beginShape(TRIANGLE_STRIP ) ;
    texture(gioconda);
    vertex(-100, -300, 0, 0, 0);
    vertex(100, -300, 0, 1, 0);
    vertex(-100, -100, 0 , 0 , 1 ) ;
    vertex(100, -100, 0, 1, 1);
    vertex(-100, 100, 0, 0, 0);
    vertex(100, 100, 0, 1, 0);
    endShape();
  popMatrix();
  */
  //pointLight(250, 250, 250, wall - 150, -tall/2, bottom -150);
  pushMatrix();
    translate(wall - 5 * jupiterr/4, 0, bottom - 5 * jupiterr/4);
    rotateY(radians(jupiterSpeed));
    shape(jupiter);
  popMatrix();
  
  
  pushMatrix();
    translate(wall - 200, 3*roof/4, -bottom +200);
    rotateY(radians(180));
    rotateX(radians(90));
    scale(1.5);
    shape(david);
  popMatrix();  
  
  
  //pointLight(100, 100, 100, 0, 0, 0);


  //pantalla mar
  pushMatrix();
    directionalLight(101, 152, 176, -1, 0, 0);

    translate(centerSize+0.1, 0,0);
    rotateY(radians(90));
    stroke(0);
    textureMode(NORMAL);
    //shininess(100);

    beginShape();
    texture(mar);
    vertex(-400, -200, 0, 0, 0);
    vertex(400, -200, 0, 1, 0);
    vertex(400, 200, 0, 1, 1);
    vertex(-400, 200, 0, 0, 1);
    endShape();
  popMatrix();
  

  //pantalla selva
    pushMatrix();
    directionalLight(101, 152, 176, 0, 0, -1);

    translate(0, 0,centerSize+0.1);
    stroke(0);
    textureMode(NORMAL);
    //shininess(100);

    beginShape();
    texture(selva);
    vertex(-400, -200, 0, 0, 0);
    vertex(400, -200, 0, 1, 0);
    vertex(400, 200, 0, 1, 1);
    vertex(-400, 200, 0, 0, 1);
    endShape();
  popMatrix();
  
  //pantalla lava
  pushMatrix();
    directionalLight(101, 152, 176, 0, 0, 1);

    translate(0, 0,-centerSize-0.1);
    stroke(0);
    textureMode(NORMAL);
    //shininess(100);

    beginShape();
    texture(lava);
    vertex(-400, -200, 0, 0, 0);
    vertex(400, -200, 0, 1, 0);
    vertex(400, 200, 0, 1, 1);
    vertex(-400, 200, 0, 0, 1);
    endShape();
  popMatrix();
  
  //temas de movimiento
  move();
  jupiterSpeed =  (jupiterSpeed >= 360)? 0 : jupiterSpeed + 0.5;
}

void createRoom(float x, float y, float z, float posx, float posy, float posz, PImage pared) {
  pushMatrix();
  translate(posx, posy, posz);
  beginShape(QUADS);
  texture(pared);

  // +Z "front" face
  vertex(-x, -y, z, 1, 1);
  vertex(x, -y, z, 1, 0);
  vertex(x, y, z, 0, 0);
  vertex(-x, y, z, 1, 0);

  // -Z "back" face
  vertex(x, -y, -z, 1, 1);
  vertex(-x, -y, -z, 0, 1);
  vertex(-x, y, -z, 0, 0);
  vertex(x, y, -z, 1, 0);

  

  // -Y "top" face
  vertex(-x, -y, -z, 1, 1);
  vertex(x, -y, -z, 0, 1);
  vertex(x, -y, z, 0, 0);
  vertex(-x, -y, z, 1, 0);

  // +X "right" face
  vertex(x, -y, z, 1, 1);
  vertex(x, -y, -z, 0, 1);
  vertex(x, y, -z, 0, 0);
  vertex(x, y, z, 1, 0);

  // -X "left" face
  vertex(-x, -y, -z, 1, 1);
  vertex(-x, -y, z, 0, 1);
  vertex(-x, y, z, 0, 0);
  vertex(-x, y, -z, 1, 0);

  endShape();
  
  beginShape();
  // +Y "bottom" face
    textureWrap (REPEAT) ;
    texture(madera);
    vertex(-x, y, z, 4, 4);
    vertex(x, y, z, 0, 4);
    vertex(x, y, -z, 0, 0);
    vertex(-x, y, -z, 4, 0);
  endShape();
  popMatrix();
}

void rotateCamera(float angleY, float angleX){
  float[][] maskY = {{cos(angleY), 0, sin(angleY)}, {0, 1, 0}, {-sin(angleY), 0, cos(angleY)}};
      
  float[] newView = {0,0,0};
  float[] newSideDir = new float[3];
  for(int m = 0; m < 3; m++){
    for(int n = 0; n < 3; n++){
      newView[m] += dirPos[n] * maskY[n][m];
      newSideDir[m] += sideDir[n] * maskY[n][m];
    }
  }
      
  sideDir = newSideDir;
  dirPos = newView;
  dirPos[1] -= angleX;
}
  
public void moveForward(float i){
  camPos[0] += dirPos[0] * i;
  camPos[2] += dirPos[2] * i;
  
  if(camPos[0] > wall-distanceMinWall || camPos[0] < -wall+distanceMinWall ||
    camPos[2] > bottom-distanceMinWall || camPos[2] < -bottom+distanceMinWall ||
    (camPos[0] < centerSize+distanceMinWall && camPos[0] > -centerSize-distanceMinWall &&
    camPos[2] < centerSize+distanceMinWall && camPos[2] > -centerSize-distanceMinWall)){
    camPos[0] -= dirPos[0] * i;
    camPos[2] -= dirPos[2] * i;
  }
}

public void moveSide(float i){
  camPos[0] += sideDir[0] * i;
  camPos[2] += sideDir[2] * i;
  
  if((camPos[0] > wall-60 || camPos[0] < -wall+60 || 
  camPos[2] > bottom-60 || camPos[2] < -bottom+60) ||
  (camPos[0] < centerSize+distanceMinWall && camPos[0] > -centerSize-distanceMinWall &&
  camPos[2] < centerSize+distanceMinWall && camPos[2] > -centerSize-distanceMinWall)){
    camPos[0] -= sideDir[0] * i;
    camPos[2] -= sideDir[2] * i;
  }
}
  
void move(){
  if(w) moveForward(speed);
  if(s) moveForward(-speed);
  if(a) moveSide(speed);
  if(d) moveSide(-speed);
}
  
void keyPressed(){
  /*if(key == 's'){
    gifExport.finish();
  }*/
  
  switch(key){
    /*case 'b':
      //gifExport.finish();
      break;
    */
    case 'w':
      w = true;
      break;
    case 's':
      s = true;
      break;
    case 'a':
      a = true;
      break;
    case 'd':
      d = true;
      break;  
    case 'l':
      lightsOff = !lightsOff;
      break;
  }
}  
  
void keyReleased(){
  /*if(key == 's'){
    gifExport.finish();
  }*/
  
  switch(key){
    case 'w':
      w = false;
      break;
    case 's':
      s = false;
      break;
    case 'a':
      a = false;
      break;
    case 'd':
      d = false;
      break;
  }
}

void mouseDragged(){
  rotateCamera(radians((mouseX - pmouseX)), radians((pmouseY - mouseY)));
}
