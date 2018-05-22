//THE ALL MIGHTY INTERATION MACHINE OF GLORY


      int spiralSize =  0   ;


//GLOBAL VARIABLES
int scrollRight = 1;
int clickLeft = 0;
color test;
float ratio = spiralSize * 256;
int direction = 1;
int spirals = 1;
//DRAW LOOP
void draw()
{
  background(#FFBC00);
  final float xCent = width / 2;
  final float yCent = height / 2;
  float ratio = spiralSize * 256;
  float deltaAngle = TWO_PI / spirals;
  for(int runSpiral = spirals; runSpiral < spirals; runSpiral++)
  {
    for(int its = spiralSize; its > /*input.length - 1*/ 0; its -= 10)
    {
      //float xFin = xCent + (its * cos(findAngle(its)));
      //float yFin = yCent + (its * sin(findAngle(its)));
      //float xFin2 = xCent + ((its == input.length ? input[0] : input[its + 1]) * cos(findAngle((its == input.length ? input[0] : input[its + 1]))));
      //float yFin2 = yCent + ((its == input.length ? input[0] : input[its + 1]) * sin(findAngle((its == input.length ? input[0] : input[its + 1]))));
      test = color(its / ratio, its / ratio, its / ratio);
      float xFin = xCent + (its * cos((findAngle(its, (runSpiral * deltaAngle)))));
      float yFin = yCent + (its * sin((findAngle(its, (runSpiral * deltaAngle)))));    
      float xFin2 = xCent + (its - 10) * cos((findAngle(its - 10, (runSpiral * deltaAngle))));
      float yFin2 = yCent + (its - 10) * sin((findAngle(its - 10, (runSpiral * deltaAngle))));
      
      //noStroke();
      //fill(test);
      //triangle(xCent, yCent, xFin, yFin, xFin2, yFin2);
      stroke(test);
      line(xFin, yFin, xFin2, yFin2);
    }
  }
}

//SETTINGS
void setup() 
{
  color col = #FFBC00;
  //fullScreen();
  size(1000, 1000);
  background(col);
}

void keyPressed()
{
  if (key == 'e'){ exit(); } 
  if(key == 'f') { spiralSize += 10 * direction; }
  if(key == 'g') { spiralSize += 20 * direction; }
  if(key == 'h') { spiralSize += 30 * direction; }
  if(key == 'j') { spiralSize += 40 * direction; }
  if(key == 'k') { spiralSize += 50 * direction; }
  if(key == 'l') { spiralSize += 60 * direction; }
  if(key == ' ') { direction *= -1; }
  if(key == 'q') 
  { 
    if(spirals == -1) { spirals = 1; } 
    else { spirals++; }
  }
  if(key == 'e') 
  { 
    if(spirals == 1) { spirals = 1; } 
    else { spirals--; }
  }
}

//FINDS ANGLE
float findAngle(int spiSize, float added)
{
  float fibQuadA = 1;
  float fibQuadB = 0;
  int its = 0; 
  float multi = added;
  float ret;
  
  for(its = 0; spiSize > fibQuadA && spiSize > fibQuadB; its++)
  {
   if(its % 2 == 0){fibQuadB += fibQuadA;}
   else{fibQuadA += fibQuadB;} 
  }
  
  if(fibQuadA > fibQuadB) { ret = (((spiSize - fibQuadB) / (fibQuadA - fibQuadB)) * (PI / 2)); }
  else{ ret = ((spiSize - fibQuadA) / (fibQuadB - fibQuadA) * (PI / 2)); }
  
  while(multi > (PI / 2))
  {
     multi -= (PI / 2);
     its++;
     if( multi < (PI / 2)) { ret += multi; }
  }
  
  switch(its%4)
  {
  case(0): //Q1 - Lower right  
    break;
  case(1): //Q3 - Lower left 
    ret += PI / 2;
    break; 
  case(2): //Q2 - Upper left
    ret += (PI);
    break;
  case(3): //Q4 - Upper right
    ret += (3 * (PI / 2));
    break;
  }
  return ret;
}