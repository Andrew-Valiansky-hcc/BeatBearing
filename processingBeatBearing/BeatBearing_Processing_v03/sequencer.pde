//------------------------------------
// Sequencer 
// download library from: http://www.texone.org/promidi/
//------------------------------------
// NOTE: this sequencer is being used in a slightly alternative way.
//       A MIDI note is being sent for every ball, even if it's currently off.
//       The off note is being sent as MIDI note 0 (C-2).
//       So you need to make sure that note C-2 isn't triggering any sound.
//       I'm sure there's a much better way of doing it than this, but I found that there were timing
//            issues with adding and removing events too rapidly, and this avoided the problem.
//------------------------------------
// KNOWN PROBLEM:
// If you are on a mac and no MIDI inputs or outputs show up other than the Java Sound Synthesiser, 
// then you may need to instal mmj, so that Processing can access your computers MIDI :
// http://humatic.de/htools/mmj.htm
//------------------------------------

void sequencerSetup() {

  // create new sequencer
  sequencer = new MidiBus();

  // setup MIDI
  midiIO = MidiIO.getInstance();
  
  // print out a list of available MIDI devices
  // use this to select the number of the MIDI device you'd like to use
  midiIO.printDevices();
  
  // close MIDI output 1, before it is reopened in the next command
  // this may not be entirely necessary, but may prevent an open output being reopened
  //midiIO.closeOutput(0);
  
  // select which channel and device to use
  // format of unction is: getMidiOut(midiChannel, outDeviceNumber);
  // I'm selecting the Mac's IAC bus, which is shown as output 1
  midiOut = midiIO.getMidiOut(0,0);
  
  // create new track
  track = new MidiBus ("one", midiOut);

  // set track quantisation
  track.setQuantization(Q._1_4);
 
  // set up the song
  song = new Song("song", bpm);
  
  // add the track to the song
  song.addTrack(track);
  
  // set the sequencer to the song
  sequencer.setSong(song);
  
  // set the start and end point of the sequence
  sequencer.setLoopStartPoint(0);
  sequencer.setLoopEndPoint(endPoint);
  
  // loop continuously
  sequencer.setLoopCount(-1);

  // start the sequencer
  sequencer.start;
  
  // the sequencer is now set up
  sequencerIsSetup = true;
}
