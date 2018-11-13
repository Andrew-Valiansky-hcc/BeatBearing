# Executing drumTest.py depends upon the python environment being able to find these three files:
#	ctcsound.py
#	drumMachine.orc
#	drumbTest.sco
# These three files (and some jupyte files explaining things) are found in the file ctcsound.zip

import ctcsound
cs = ctcsound.Csound()
ret = cs.compile_("csound", "-o", "dac", "C:/Users/SET165-07U/Downloads/drumMachine.orc", "C:/Users/SET165-07U/Downloads/drumTest.sco")
if ret == ctcsound.CSOUND_SUCCESS:
    cs.perform()
    cs.reset()