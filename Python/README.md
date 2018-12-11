# Python Beat Bearing File descriptions

.ipynb_checkpoints --- created by jupyter when looking at Canopy Document, can delete, but will just reappear, could configure github to ignore

_pycache_   --- same as above

beatBearingTest-FourSounds -- standalone python program to play four instruments simulataneously, eight times

Beatfox.csd --- is opened by drumPerform, generates random drum instruments and plays them forever

ctcsound --- is library that all python and jupyter files need to open, is installed with csoundQt

drumMachine.orc --- is an orchestra of 5 instruments ... used three of them in beatBearingTest-FourSounds 

drumTest.sco ... the score for drumMachine.orc 
could be turned into 16 score files and played for the 16 possible column ball positions

drumPerform .. canopy document that plays both Beatfox and the pair of drumMachine.orc and drumTest.sco

pySerialToBinary ... listens to final arduino code, produces a series of 5 bytes represent 32 balls and metronone information

Next Steps: turn drumTest.sco into 16 files, modify beatBearingTest so it sounds reasonable, then merge with pySerialToBinary.

