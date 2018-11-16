
int switch1 = 7;      //7 is the arduino digital hole number, switch1 is pb1 on the button/LED wing
int switch2 = 5;      //pb stands for push button
int switch3 = 3;      //push buttons are “on” only when pushed down
int switch4 = 13;     //when not touching, push buttons are off .. arduino digital 1 leaves led4 on … save for tx serial communication 
int led1 =  12;       // 12 is the arduino digital hole number, led1 is LED1 on the button/LED wing
int led2 =  11;      
int led3 =  10;
int led4 =  9;
//have finished variable definition section
 
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
}
//done with the setup code

void loop() 
{
 if (digitalRead(switch4) == HIGH) 
 {
    digitalWrite(led4, HIGH);
 } 
  else 
 {
  digitalWrite(led4, LOW);
 }
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
 else {digitalWrite(led2, LOW);
 }
 if (digitalRead(switch3) == HIGH) 
 {
 digitalWrite(led3, HIGH);
 } 
 else {digitalWrite(led3, LOW);
 }
}

