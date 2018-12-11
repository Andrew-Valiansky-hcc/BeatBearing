# Arduino Beat Bearing

32 wires go to 2 16 input mux boards

mux boards have 8 select lines the arduino uses to query the muxes

the muxes respond to the arduino query through one wire from each mux Z_1, Z_2 

there is a logisim file called muxSimulation that animates how this operates

---------------------------------------------------------------------------------------------
the arduino reads 32 ball positions through the muxes and ends up creating a boolean array

the mux is an anolog mux so each ball position is a number between 0 and 1023

the 8 most recent positions of each of the 32 balls are added together to debounce the circuit

the output is packaged into 4 bytes


---------------------------------------------------------------------------------------------
a 5th byte is created from a counter with an arbitrary maximum ... the metronome

the arbitrary maximum needs to be adjusted to set the metronome upper limit

this is what can be manipulated once a pot is created

the maxMetronome value, once adjusted needs to be changed in the processing and python code

----------------------------------------------------------------------------------------------
for testing purposes a noBeatBearBoard boolean was created that ignores the mux/beat bearing board attached

it instead uses random numbers to create 32 random ball positions

----------------------------------------------------------------------------------------------
the arduino code sends out 5 bytes seperated by an ascii hypen so that the serial output looks like
54-163-73-209-40  
  
The first four numbers are 32 bits representing 32 ball positions.  
The last number should increment to the maxMetronome value then start over at 0.  
-----------------------------------------------------------------------------------------------

Next step is to get it working with the mux board


