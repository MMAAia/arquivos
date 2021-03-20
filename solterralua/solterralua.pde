int rSol = 100;
int rTerra = 80;
int rLua = 40;
int rmarte = 70;
int restrela = 30;

float anguloTerra = -PI/3;
int distanciaSolTerra = 200;
int distanciaTerraLua = 80;
int distanciaSolmarte = 350;
int distanciaestrela = 70;
float anguloLua = -PI/2;
float angulomarte = -PI/3;
float anguloestrela = -PI/2;
float incrementoAnguloTerra = 0.01;
float incrementoAnguloLua = 0.08;
float incrementoAngulomarte = 0.01;
float incrementoAnguloestrela = 0.03;
void setup()
{
  size(1000,1000);
  background(255,0,255);
}

void desenhaSol()
{
  pushMatrix();
  translate(width/2,height/2);
  fill(255,255,0);
  circle(0,0,rSol);
  desenhaTerra();
  desenhamarte();
  popMatrix();
}


void desenhaTerra()
{
  pushMatrix();
  rotate(anguloTerra);
  translate(distanciaSolTerra, 0);
  fill(0,0,255);
  circle(0,0,rTerra);
  desenhaLua();
  
  popMatrix();
}

void desenhaLua()
{
  pushMatrix();
  rotate(anguloLua-anguloTerra);
  translate(distanciaTerraLua, 0);
  fill(0,0,255);
  circle(0,0,rLua);
  popMatrix();
}
void desenhamarte(){
   pushMatrix();
   rotate(angulomarte);
   translate(distanciaSolmarte, 0);
   fill(255,0,0);
   circle(0,0,rmarte);
   desenhaestrela();
   popMatrix();
}
  void desenhaestrela(){
   pushMatrix();
   rotate(anguloestrela);
   translate(distanciaestrela, 0);
   fill(255,255,255);
   circle(0,0,restrela);
   popMatrix();
  
}
 
void draw() 
{
  //background(200);
  desenhaSol();
  anguloTerra += incrementoAnguloTerra;
  anguloLua += incrementoAnguloLua;
  angulomarte += incrementoAngulomarte;
  anguloestrela += incrementoAnguloestrela;
}
