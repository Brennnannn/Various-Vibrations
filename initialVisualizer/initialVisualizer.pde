//GLOBAL VARIABLES
int scrollRight = 1;
int clickLeft = 0;
int[] input = {20, 30, 40, 50, 60, 70, 80, 90};
//DRAW LOOP
void draw()
{
  //background(#FFBC00);
  final float xCent = width / 2;
  final float yCent = height / 2;
  for(int its = 0; its < /*input.length - 1*/ 500; its += 10)
  {
    //float xFin = xCent + (its * cos(findAngle(its)));
    //float yFin = yCent + (its * sin(findAngle(its)));
    //float xFin2 = xCent + ((its == input.length ? input[0] : input[its + 1]) * cos(findAngle((its == input.length ? input[0] : input[its + 1]))));
    //float yFin2 = yCent + ((its == input.length ? input[0] : input[its + 1]) * sin(findAngle((its == input.length ? input[0] : input[its + 1]))));
    
    float xFin = xCent + (its * cos(findAngle(its)));
    float yFin = yCent + (its * sin(findAngle(its)));
    float xFin2 = xCent + ((its == input.length ? 0 : its + 10) * cos(findAngle((its == input.length ? 0 : its + 10))));
    float yFin2 = yCent + ((its == input.length ? 0 : its + 10) * sin(findAngle((its == input.length ? 0 : its + 10))));
    color test = color(its / 2, its / 2, its / 2);
    noStroke();
    fill(test);
    triangle(xCent, yCent, xFin, yFin, xFin2, yFin2);
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
  if (key == 'e')
  {
    exit();
  }  
}

//FINDS ANGLE
float findAngle(int spiSize)
{
  float fibQuadA = 1;
  float fibQuadB = 0;
  int its = 0; 
  float ret;
  
  for(its = 0; spiSize > fibQuadA && spiSize > fibQuadB; its++)
  {
   if(its % 2 == 0){fibQuadB += fibQuadA;}
   else{fibQuadA += fibQuadB;} 
  }
  
  if(fibQuadA > fibQuadB) { ret = (((spiSize - fibQuadB) / (fibQuadA - fibQuadB)) * (PI / 2)); }
  else{ ret = ((spiSize - fibQuadA) / (fibQuadB - fibQuadA) * (PI / 2)); }
  
  switch(its%4)
  {
  case(0): //Q4
    ret += ((3 * PI) / 4);
    break;
  case(1): //Q1
    
    break;
  case(2): //Q2
    ret += (PI / 2);
    break; 
  case(3): //Q3
    ret += PI;
    break;
  }
  return ret;
}  