s.boot();

Env.linen(5, 1, 9).plot();

// This is the basic syntax for a synth definition

/*
* Unit generator: generate values
*/

//gate indicates and env to start reading and end reading itself
(
SynthDef(\syntho, { | freq = 500, gate = 1 |

	var sinSignal, env;

	/*
	* The easy way to write and envelop is the one below
	* The action is an event that happens when the env ends read
	* with donde 2, when the event ends, we dont need the synth.free
	*/
	env = EnvGen.kr(Env.linen(5, 1, 9), gate, doneAction:2);
	sinSignal = SinOsc.ar(freq, 0, 0.6);

	// we need tp multiplicate to scale dinamically the signal
	Out.ar(0,sinSignal * env);

}).add();
)


~mySynth = Synth(\syntho);
~mySynth.set(\freq, 700);
~mySynth.set(\gate,0);
//~mySynth.free();
