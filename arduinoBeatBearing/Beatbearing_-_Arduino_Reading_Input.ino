int stateMatrix[32][8] = {        
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0};  

boolean bState[32] = {
  B0, B0, B0, B0, B0, B0, B0, B0,
  B0, B0, B0, B0, B0, B0, B0, B0,
  B0, B0, B0, B0, B0, B0, B0, B0,
  B0, B0, B0, B0, B0, B0, B0, B0};

void setup() 
{
  Serial.begin(9600);

  pinMode(A0, INPUT);                        
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(A3, INPUT);
  pinMode(A4, INPUT);      
  pinMode(A5, INPUT);
  pinMode(A6, INPUT);
  pinMode(A7, INPUT);
   
}

void loop() 
{
  Serial.println(A2); 


  int state = 1;
  for (int n = 0; n < 32; n++) 
  {
    if (state = 0)
    {
    ("Empty");

    }
    
    else
    { 
    ("Complete");

    }
    
  }
}



