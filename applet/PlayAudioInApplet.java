	import java.applet.Applet;
	import java.applet.AudioClip;
	import java.awt.Graphics;
   import java.awt.*;
   import java.awt.event.*;
   	 
	public class PlayAudioInApplet extends Applet {
   Label     ausgabe;
  	     
	    private static final long serialVersionUID = 2530894095587089544L;
	     
	    private AudioClip clip;
	     
	    // Called by the browser or applet viewer to inform
	    // this applet that it has been loaded into the system.
	    public void init() {
	         
           setLayout( new BorderLayout() );
              ausgabe.setText( "Horst's Musikplayer: " );
 	        clip = getAudioClip(getDocumentBase(), "http://localhost/daten/musik/eleanor_sms.mp3");
	         
	    }
	     
	    // Paints the container. This forwards the paint to any
	    // lightweight components that are children of this container.
	    public void paint(Graphics g) {
	         
	        // Start playing this audio clip. Each time this method is called,
	 
	  // the clip is restarted from the beginning.
	        clip.play();
	 
	 
	  // Stops playing this audio clip.
	        clip.stop();
	 
	 
	  // Starts playing this audio clip in a loop.
	        clip.loop();
	         
	    }
	 
	}