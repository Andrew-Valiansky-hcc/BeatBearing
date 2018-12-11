# Python Beat Bearing File descrkiptions

.ipynb_checkpoints --- created by jupyter when looking at Canopy Document, can delete, but will just reappear, could configure github to ignore

_pycache_   --- same as above

beatBearingTest-FourSounds -- standalone python program to play four instruments simulataneously, eight times

Beatfox.csd --- is opened by drumPerform 
ctcsound --- is library that all python and jupyter files need to open .. haven't figured out how to use it like a normal

python package ... csound puts somewhere that jupyter can find it ... so have been installing csound 

drumMachine.orc .... is an orchestra of 5 instruments ... used three of them in beatBearingTest-FourSounds -- it is paired with
drumTest.sco ... the score .. these could be hacked ... 16 score files could be created and played for the 16 possible combinations
of a column of four balls

drumPerform .. canopy document that plays both Beatfox (which has the orchestra and score built into it) and the pair of drumMachine.orc and drumTest.sco

pySerialToBinary ... listens to final arduino code, produces a series of 5 bytes represent 32 balls and metronone information
