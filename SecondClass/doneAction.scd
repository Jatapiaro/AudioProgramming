s.boot();

// This is the basic syntax for a synth definition

/*
* Unit generator: generate values
*/

//gate indicates and env to start reading and end reading itself
(
SynthDef(\syntho, { | freq = 400, gate = 1 |

	var sinSignal, env, noise;

	env = EnvGen.kr(Env.asr(2, 3, 3), gate, doneAction:2);
	/*Change the range where signal changes*/
	noise = Saw.kr(1).range(100,300);
	sinSignal = SinOsc.ar(noise, 0, 0.8);

	Out.ar(0, sinSignal * env);
}).add();
)


/* MIDI notes go from 0 - 127*/
~synth = Synth(\syntho);
~synth.set(\freq, 10);
~synth.set(\gate, 0);

~synth2 = Synth(\syntho, [\freq,500]);
~synth2.set(\freq, 76.midicps);
~synth2.set(\gate, 0);

s.plotTree