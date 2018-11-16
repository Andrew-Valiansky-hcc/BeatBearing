
int switch1 = 7;      //Pin for Switch 1
int switch2 = 5;      //Pin for Switch 2                
int switch3 = 3;      //Pin for Switch 3
int switch4 = 2;      //Pin for Switch 4 

int led1 =  12;       //Pin for LED output 1 
int led2 =  11;       //Pin for LED output 2 
int led3 =  10;       //Pin for LED output 3 
int led4 =  9;        //Pin for LED output 4  

//push buttons are “on” only when pushed down
//when not touching, push buttons are off .. arduino digital 1 leaves led4 on … save for tx serial communication
//12 is the arduino digital hole number, led1 is LED1 on the button/LED wing

//Finished variable definition section
 
void setup() 
{
  // initialize the LED pins as an outputs:
  pinMode(led1, OUTPUT);   
  pinMode(led2, OUTPUT); 
  pinMode(led3, OUTPUT); 
  pinMode(led4, OUTPUT); 

  // initialize the pushbutton pins as an inputs:
  pinMode(switch1, INPUT); 
  pinMode(switch2, INPUT); 
  pinMode(switch3, INPUT); 
  pinMode(switch4, INPUT);

  //done with the setup code
}

void loop() 
{
  
 if (digitalRead(switch1) == HIGH) 
 {
    digitalWrite(led1, HIGH);
 } 
 else 
 {
    digitalWrite(led1, LOW);
 }
 
 if (digitalRead(switch2) == HIGH) 
 { 
    digitalWrite(led2, HIGH);
 } 
 else 
 {
    digitalWrite(led2, LOW);
 }
 
 if (digitalRead(switch3) == HIGH) 
 {
    digitalWrite(led3, HIGH);
 } 
 else 
 {
    digitalWrite(led3, LOW);
 }
 
 if (digitalRead(switch4) == HIGH) 
 {
    digitalWrite(led4, HIGH);
 } 
  else 
 {
    digitalWrite(led4, LOW);
 }
}

