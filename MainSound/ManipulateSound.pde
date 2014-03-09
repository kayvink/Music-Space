import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

// The prototype class to be used for the manipulation
// of sound samples on the shape objects
// filters, pitch , volume, tempo, eq, max effects 

class ManipulateSound {
  AudioSample sample; 
  InteractiveObjects object; 
  Minim minim;

  ManipulateSound(AudioSample sample, InteractiveObjects object)
  {
    this.sample = sample;
    this.object = object;
    minim = new Minim(this);
  }

  void loadSound(String fileName, int bufferSize)
  {
    sample = minim.loadSample(fileName, bufferSize);
  }

  void mute()
  {
    sample.mute();
  }
    
  void setGain(float value)
  {
    // gain value might be limited
    sample.setGain(value);
  }
}
