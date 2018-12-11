# BeatBearing

This is the software documentation of the Howard Community College BeatBearing Project Fall 2019. More information is available on
<a href=https://drive.google.com/open?id=17BUsjdtlKxZ1XTiiMZvftNGVOXfZ8mOC>google drive</a>. 
   
They are in three folders: arduino, processing and python.

All the code pieces work. They have all worked together. 

The current breaking point is the arduino reading mux output correctly. See the arduino folder. 

Processing controls the monitor underneath the beat bearing board.

Python is currently in two pieces. It listens successfully to the arduino and in parallel with processing listening to the arduino through com0com. The second bit of python code plays some really bad drum beats. The actual music/drum beats are being performed by a python synthesizer called csoundQt when it is a standalone gui. When standalone it uses a package called ctcsound. 

Install csoundQt and enthought canopy 3.5 to look at the details in the python folder including juypter files.

