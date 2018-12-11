# Python Beat Bearing Code

Hello  
   
Three or four or five different programs are being run in this first attempt to create software for the beat bearing.

They are in three folders: arduino, processing and python.

The actual music/drum beats are being performed by a python synthesizer called csoundQt when it is a standalone gui. When it is a processing package or module it is called ctcsound. 

There is a python (tested in 3.5) program that will execute a drumMachine test independent of any processing code. Look in the python folder. Should be able to execute from the command line.

There is a python http deamon that listens for any connection by any client and begins playing the drumtest. Connect to http://127.0.0.1:50007 .. See drumTestwithHTTP.py

There is a processing client (drumTestClient.pde) that creates a connection to http://127.0.0.1:50007 automatically upon running and begins sending the word 'start'. Have not successfully parced this word. That is the next step. The connection by itself triggers the python http deamon into playing the drums. ... so can trigger with what ever browser you are using to view this ... if the python http deamon is setup. 

The processing files also contain the code for makeing the ellipses and the line that moves across the screen. The line is controlled by the metrenome in arduino. Also it contains code for random ball location to light up (this was done, because the inputs from the board were not being read by the arduino when the balls were being moved around on the board)
