s.boot();

(
SynthDef(\synth, { arg freq = 20,  amp = 1;

	var sin1, sin2;

	freq = MouseX.kr(20,20000);
	amp = MouseY.kr(1,10000);

	/*
	* More than 1000 amp will saturate speakers
	* But, the real amp is the 0,8 in sin2
	* the sin1 it's just used as the frequency
	*/
	sin1 = SinOsc.ar(freq, 0, amp);
	sin2 = SinOsc.ar(sin1 + 800, 0, 0.8);
	Out.ar(0, sin2);

}).add();
)

~synth = Synth(\synth);

~synth.free();

