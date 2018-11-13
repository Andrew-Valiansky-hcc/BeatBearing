import ctcsound
cs = ctcsound.Csound()
ret = cs.compile_("csound", "-o", "dac", "C:/Users/SET165-07U/Downloads/drumMachine.orc", "C:/Users/SET165-07U/Downloads/drumTest.sco")
if ret == ctcsound.CSOUND_SUCCESS:
    cs.perform()
    cs.reset()