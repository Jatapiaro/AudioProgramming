s.boot();

(
SynthDef(\syntho, { | freq = 4000, gate = 1 |

	var sinSignal, env, noise;

	env = EnvGen.kr(Env.asr(2, 3, 3), gate, doneAction:2);

	noise =  LFPar.ar(MouseX.kr(freq, 100),0,0.1) * freq;
	sinSignal = SinOsc.ar(noise, 0, 0.2);

	Out.ar(0, sinSignal * env);

}).add();

SynthDef(\syntho2, { | freq = 400, gate = 1 |

	var sinSignal, env, noise;

	env = EnvGen.kr(Env.asr(2, 3, 3), gate, doneAction:2);
	/*Change the range where signal changes*/
	noise = Saw.kr(3).range(100,300) ;
	sinSignal = SinOsc.ar(noise, 0, 0.8);

	Out.ar(0, sinSignal * env);
}).add();

)

~synth = Synth(\syntho);
~synth.set(\freq, 90.midicps);
~synth.set(\gate, 0);

~synth2 = Synth(\syntho2);
~synth2.set(\freq, 10.midicps);
~synth.set(\gate, 0);