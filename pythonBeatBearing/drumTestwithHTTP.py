# this program has the same requirements as drumTest
# to execute it, in the canopy editor, go to Run then press reset
# hit the green arrow to start it listening for processing
# then start the drumTestclient processing sketch
# you will hear the drumTest until you kill the processing sketch

import ctcsound
cs = ctcsound.Csound()

# web server
import socket

HOST = ''                 # Symbolic name meaning all available interfaces
PORT = 50007              # Arbitrary non-privileged port
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
conn, addr = s.accept()
print('Connected by', addr)
while True:
    data = conn.recv(1024)
    if not data: break
    print('..',data,'..') # Paging Python!
    # do whatever you need to do with the data
    print(" b'start' ")
    print('here')
    ret = cs.compile_("csound", "-o", "dac", "C:/Users/SET165-07U/Downloads/drumMachine.orc", "C:/Users/SET165-07U/Downloads/drumTest.sco")
    if ret == ctcsound.CSOUND_SUCCESS:
        cs.perform()
        cs.reset()
        break
conn.close()
# optionally put a loop here so that you start 
# listening again after the connection closes

