//Let's Do a SynthDef

s.boot();

(
SynthDef(\one, { arg freq = 500,  freq2 = 350;

	var sin1, sin2;

	sin1 = SinOsc.ar(freq, 0, 0.5);

	sin2 = sin1 * SinOsc.ar(freq2, 0, 0.5);

	Out.ar(0, sin2);

}).add();
)



~synth = Synth(\one);
~synth.set(\freq, 90, \freq2, 140);

/*
(
 var counter;

 counter = 90;

 {counter < 500}.while ({
	var co2 = counter + 90;
	~synth.set(\freq2, counter);
	counter = counter + 1;
 })
)*/

/* Free the synth */
~synth.free();

/*Tell the server to 'kill' the synth*/
s.sendMsg(\n_free, 1001);