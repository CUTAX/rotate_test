import peasy.*;
PeasyCam cam;

XyzVector XyzVector;

float theta=0, psi=0;
float pitch=10;
float psiPitch=20;
int psiNum;

PFont font;
int textSize=20;

void setup() {
  size(displayWidth, displayHeight, P3D);

  cam = new PeasyCam(this, 200);
  cam.setMinimumDistance(500);
  cam.setMaximumDistance(500);

  ortho(-width/2, width/2, -height/2, height/2, -1000, 1000);
  ambientLight(20, 20, 20);    //環境光を当てる
  lightSpecular(255, 255, 255);    //光の鏡面反射色（ハイライト）を設定
  directionalLight(100, 100, 100, 0, 1, -1);    //指向性ライトを設定

  XyzVector=new XyzVector(100);

  font =loadFont("OCRAExtended-48.vlw");
  textFont(font);
}

void draw() {
theta=mouseX;
psi=mouseY;

  background(0);
  XyzVector.display();
  pushMatrix();
  rotateX(radians(90));
  rotateY(radians(psi));
  rotateZ(radians(theta));
  stroke(255);
  psiNum=floor(90/psiPitch);
  for (int j=-psiNum; j<=psiNum; j++) {
    pushMatrix();
    rotateY(radians(j*psiPitch));
    for (int i=-10; i<=10; i++) {
      line(i*pitch, 50, i*pitch, 0);
    }
    popMatrix();
  }
  popMatrix();
}


//int setmouseX;
//void mousePresse() {
//  if (mouseButton == LEFT&&mouseButton==RIGHT) {
//    setmouseX=mouseX;
//  }
//}

//void mouseDragged() {
//  if (mouseButton == LEFT) {
//    theta=theta+mouseX-setmouseX;
//  }
//  if (mouseButton == RIGHT) {
//    psi=psi+mouseX-setmouseX;
//  }
//}