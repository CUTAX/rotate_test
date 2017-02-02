import peasy.*;
PeasyCam cam;


XyzVector XyzVector;




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
  background(0);
   XyzVector.display();
rect(-50,0,50,50);

}