# BeatBearing
Hi  
   
Three or four or five different programs are being run in this first attempt to create software for the beat bearing.

They are in three folders: arduino, processing and python.

The actual music/drum beats are being performed by a python synthesizer called csoundQt when it is a standalone gui. When it is a processing package or module it is called ctcsound. 

There is a python (tested in 3.5) program that will execute a drumMachine test independent of any processing code. Look in the python folder. Should be able to execute from the command line.

There is a python http deamon that listens for any connection by any client and begins playing the drumtest. Connect to http://127.0.0.1:50007

There is a processing client (drumTest.pde) that creates a connection to http://127.0.0.1:50007 automatically upon running and begins sending the word 'start'. Have not successfully parced this word. That is the next step. 
