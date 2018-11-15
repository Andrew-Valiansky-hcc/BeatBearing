void setup() {
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

}

void loop() {
 if (digitalRead(switch4) == HIGH) {
    digitalWrite(led4, HIGH);
  } else {digitalWrite(led4, LOW);}
 if (digitalRead(switch1) == HIGH) {
    digitalWrite(led1, HIGH);
  } else {digitalWrite(led1, LOW);}
 if (digitalRead(switch2) == HIGH) { 
    digitalWrite(led2, HIGH);
  } else {digitalWrite(led2, LOW);}
 if (digitalRead(switch3) == HIGH) {
    digitalWrite(led3, HIGH);
  } else {digitalWrite(led3, LOW);}
}

}
