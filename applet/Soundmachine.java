import java.io.File;
import java.io.IOException;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.SourceDataLine;
import javax.sound.sampled.*;
 
public class Soundmachine {
    private Clip clip;
    
  
    
    public Soundmachine() 
    {
	Runtime run = Runtime.getRuntime();
        {
        
        try {run.exec("mplayer http://localhost/daten/musik/eleanor_sms.mp3 &");}
        catch (IOException  e1) {e1.printStackTrace();}
	}
        }
        
    }
    

