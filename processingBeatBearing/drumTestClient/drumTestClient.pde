/* this is the raw code from the processing site https://processing.org/reference/libraries/net/Client.html
 * the only thing changed is the port from 5204 to 5007
 */
 
import processing.net.*; 
Client myClient;

void setup() { 
  size(200, 200); 
  /* Connect to the local machine at port 50007 ... to the phython http deamon
   *  (or whichever port you choose to run the
   *  server on).
   * This example will not run if you haven't
   *  previously started a server on this port.
   */
  myClient = new Client(this, "127.0.0.1", 50007); 
} 

void draw() { 
  myClient.write("start"); // send whatever you need to send here
} 
