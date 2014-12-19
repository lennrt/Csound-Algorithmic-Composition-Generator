import java.util.Random;

public class AlgorithmicGen {

	
	/*
	 * scoreGenSingle is a helper method for scoreGenMultiple
	 * 
	 * it generates a single line of score for instrument num
	 * at start time start and of duration dur
	 * 
	 */
	public static void scoreGenSingle(int num, double start, double dur) {
		System.out.println("i" + " " + num + " " + start + " " + dur);
	}
	
	/*
	 * scoreGenMultiple is a method that generates a Csound score
	 * in the console.
	 * 
	 * Based on the inputs, it generates a total of n lines of score 
	 * for num instruments. Each line has a random start time between 0 and 
	 * start seconds, and a random duration between 0 and dur seconds. 
	 * 
	 */
	public static void scoreGenMultiple(int n, int num, double start, double dur) {
		while (n > 0) {
			Random rnNum = new Random();
			int numRand = 1+ rnNum.nextInt(num-1);
			
			
			Random rnStart = new Random();
			double startRand = start*rnStart.nextDouble();
			
			
			Random rnDur = new Random();
			double durRand = dur*rnDur.nextDouble();
			
			scoreGenSingle(numRand, startRand, durRand);
			n--;
		}
	}
	
	/*
	 * instrGen generates a random instrument in Csound syntax and outputs
	 * it in the console.
	 * 
	 * num is the desired instrument number
	 * tableNum is the desired number of wave tables from which to
	 * randomly select
	 * 
	 * The generation process randomly decides the presence or absence
	 * of amplitude and frequency modulation, and it randomly decides
	 * the frequency and amplitude of all oscillators. The wave table
	 * used by the carrier is randomly chosen.
	 * 
	 * The resulting waveform is then filtered through a band pass filter of 
	 * random bandwidth and cutoff frequency. It is then used in waveguide 
	 * synthesis where the waveguide kfreq and kcutoff are randomized. 
	 * 
	 * An exponential envelope with decay time proportional to the note duration
	 * is also applied.
	 * 
	 */
	public static void instrGen(int num, int tableNum) {
		
		
		/*
		randomly decide the wave table number to use
		*/
		Random rnTable = new Random();
		int rnTableNum = 1+rnTable.nextInt(tableNum);
		
		/*
		randomly decide if instrument uses frequency modulation
		if 0, frequency modulation absent
		if 1, frequency modulation present
		*/
		Random rnFreq = new Random();
		int freqMod = rnFreq.nextInt(2);
		
		/*
		randomly decide if instrument uses amplitude modulation
		if 0, amplitude modulation absent
		if 1, amplitude modulation present
		*/
		Random rnAmp = new Random();
		int ampMod = rnAmp.nextInt(2);
		
		/*
		randomly decide base amplitude of carrier
		*/
		Random rnAmpCar = new Random();
		int ampCar = rnAmpCar.nextInt(500);
		
		
		/*
		randomly decide base frequency of carrier
		*/
		Random rnFreqCar = new Random();
		int freqCar = rnFreqCar.nextInt(500);
		
		
		/*
		randomly decide band pass filter cutoff frequency
		*/
		Random rnFreqFilt = new Random();
		int freqFilt = rnFreqFilt.nextInt(1000);
		
		
		/*
		randomly decide band pass filter bandwidth
		*/
		Random rnFiltBW = new Random();
		int filtBW = rnFiltBW.nextInt(500);
		
		
		/*
		randomly decide waveguide kfreq
		*/
		Random rnkFreqWG = new Random();
		int kfreqWG = rnkFreqWG.nextInt(500);
		
		
		/*
		randomly decide waveguide kcutoff
		*/
		Random rnkCutoffWG = new Random();
		int kcutoffWG = rnkCutoffWG.nextInt(5000);
		
		
		// randomized oscillator without modulation
		// filtered through band pass filter
		// and used in waveguide synthesis
		if (freqMod == 0 && ampMod == 0) {
			
		System.out.println("instr" + " " + num);
		System.out.println("aout"+num + " " + "oscil" + " " + ampCar + ", " + freqCar + ", " + rnTableNum);
		System.out.println("kenv"+num + " " + "expseg" + " " + "0.15" + ", " + "p3*.9" + ", " + "0.01");
		System.out.println("asig"+num + " " +  "reson" + " " + "aout" + num+"*kenv"+num+"," + " " + freqFilt +"," + " " + filtBW);
		System.out.println("awg"+num + " " + "wguide1" + " " + "asig"+num+"," + " " + kfreqWG + "," + " " + kcutoffWG + "," + " " + .75);
		System.out.println("out" + " " + "awg"+num+"*kenv"+num+"*.05");
		System.out.println("endin");	
			
		}
		
		// randomized oscillator with freq mod	
		// filtered through band pass filter
		// and used in waveguide synthesis
		else if (freqMod == 1 && ampMod == 0) {
			
			/*
			randomly decide base amplitude (depth of modulation) of freq modulator
			*/
			Random rnAmpMod = new Random();
			int modAmp = rnAmpMod.nextInt(100);
			
			/*
			randomly decide base frequency of freq modulator
			*/
			Random rnFreqMod = new Random();
			int modFreq = rnFreqMod.nextInt(100);
			
			System.out.println("instr" + " " + num);
			System.out.println("aoutmod"+num + " " + "oscil" + " " + modAmp + ", " + modFreq + ", " + 1);
			System.out.println("aout"+num + " " + "oscil" + " " + ampCar + ", " + freqCar+"*aoutmod"+num + ", " + rnTableNum);
			System.out.println("kenv"+num + " " + "expseg" + " " + "0.15" + ", " + "p3*.9" + ", " + "0.01");
			System.out.println("asig"+num + " " +  "reson" + " " + "aout" + num+"*kenv"+num+"," + " " + freqFilt +"," + " " + filtBW);
			System.out.println("awg"+num + " " + "wguide1" + " " + "asig"+num+"," + " " + kfreqWG + "," + " " + kcutoffWG + "," + " " + .75);
			System.out.println("out" + " " + "awg"+num+"*kenv"+num+"*.05");
			System.out.println("endin");		
			
			
		}
		
		// randomized oscillator with amp mod
		// filtered through a band pass filter of random bandwidth frequency and cutoff
		// and used in waveguide synthesis
		else if (freqMod == 0 && ampMod == 1) {
			
			/*
			randomly decide base amplitude of amp modulator
			*/
			Random rnAmpMod = new Random();
			int modAmp = rnAmpMod.nextInt(200);
			
			/*
			randomly decide base frequency of amp modulator
			*/
			Random rnFreqMod = new Random();
			int modFreq = rnFreqMod.nextInt(100);
			
			System.out.println("instr" + " " + num);
			System.out.println("aoutmod"+num + " " + "oscil" + " " + modAmp + ", " + modFreq + ", " + 1);
			System.out.println("aout"+num + " " + "oscil" + " " + ampCar+"*aoutmod"+num + ", " + freqCar + ", " + rnTableNum);
			System.out.println("kenv"+num + " " + "expseg" + " " + "0.15" + ", " + "p3*.9" + ", " + "0.01");
			System.out.println("asig"+num + " " +  "reson" + " " + "aout" + num+"*kenv"+num+"," + " " + freqFilt +"," + " " + filtBW);
			System.out.println("awg"+num + " " + "wguide1" + " " + "asig"+num+"," + " " + kfreqWG + "," + " " + kcutoffWG + "," + " " + .75);
			System.out.println("out" + " " + "awg"+num+"*kenv"+num+"*.05");
			System.out.println("endin");		
			
		}
		
		// randomized oscillator with amp mod and freq mod
		// filtered through band pass filter
		// and used in waveguide synthesis
		else {
			
			/*
			randomly decide base amplitude (depth of modulation) of freq modulator
			*/
			Random rnAmpModF = new Random();
			int modAmpF = rnAmpModF.nextInt(100);
			
			/*
			randomly decide base frequency of freq modulator
			*/
			Random rnFreqModF = new Random();
			int modFreqF = rnFreqModF.nextInt(100);
			
			
			/*
			randomly decide base amplitude of amp modulator
			*/
			Random rnAmpModA = new Random();
			int modAmpA = rnAmpModA.nextInt(200);
			
			/*
			randomly decide base frequency of amp modulator
			*/
			Random rnFreqModA = new Random();
			int modFreqA = rnFreqModA.nextInt(100);
			
			
			System.out.println("instr" + " " + num);
			System.out.println("aoutmodamp"+num + " " + "oscil" + " " + modAmpA + ", " + modFreqA + ", " + 1);
			System.out.println("aoutmodfreq"+num + " " + "oscil" + " " + modAmpF + ", " + modFreqF + ", " + 1);
			System.out.println("aout"+num + " " + "oscil" + " " + ampCar+"*aoutmodamp"+num + ", " + freqCar+"*aoutmodfreq"+num + ", " + rnTableNum);
			System.out.println("kenv"+num + " " + "expseg" + " " + "0.15" + ", " + "p3*.9" + ", " + "0.01");
			System.out.println("asig"+num + " " +  "reson" + " " + "aout" + num+"*kenv"+num+"," + " " + freqFilt +"," + " " + filtBW);
			System.out.println("awg"+num + " " + "wguide1" + " " + "asig"+num+"," + " " + kfreqWG + "," + " " + kcutoffWG + "," + " " + .75);
			System.out.println("out" + " " + "awg"+num+"*kenv"+num+"*.05");
			System.out.println("endin");	
			
			
		}
		
	}


public static void main(String[] args) {
	// Place desired calls to instrGen and scoreGenMultiple here.
	// Simply copy the console output into Csound and add your wavetables.
	
	System.out.println("<CsoundSynthesizer>");
	System.out.println("<CsInstruments>");
	System.out.println("");
	System.out.println("sr = 44100"); // adjust as necessary
	System.out.println("ksmps = 128"); // adjust as necessary
	System.out.println("");
	instrGen(1, 9);
	System.out.println("");
	instrGen(2, 9);
	System.out.println("");
	instrGen(3, 9);
	System.out.println("");
	instrGen(4, 9);
	System.out.println("");
	instrGen(5, 9);
	System.out.println("");
	instrGen(6, 9);
	System.out.println("");
	instrGen(7, 9);
	System.out.println("");
	instrGen(8, 9);
	System.out.println("");
	instrGen(9, 9);
	System.out.println("");
	instrGen(10, 9);
	System.out.println("");
	instrGen(11, 9);
	System.out.println("");
	instrGen(12, 9);
	System.out.println("");
	instrGen(13, 9);
	System.out.println("");
	instrGen(14, 9);
	System.out.println("");
	instrGen(15, 9);
	System.out.println("");
	instrGen(16, 9);
	System.out.println("");
	instrGen(17, 9);
	System.out.println("");
	instrGen(18, 9);
	System.out.println("");
	instrGen(19, 9);
	System.out.println("");
	instrGen(20, 9);
	System.out.println("");
	instrGen(21, 9);
	System.out.println("");
	System.out.println("</CsInstruments>");
	System.out.println("<CsScore>");
	System.out.println("");
	System.out.println("; Place the appropriate number of wave tables here");
	System.out.println("");
	System.out.println(""); // wave tables go here in .csd file
	System.out.println("");
	System.out.println("; instrument number, start time, duration");
	scoreGenMultiple(1500, 22, 60, 3);
	System.out.println("");
	System.out.println("</CsScore>");
	System.out.println("</CsoundSynthesizer>");
		
}

}