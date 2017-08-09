s.boot();

(
SynthDef(\synth, { arg freq = 20,  amp = 1;

	var sin1, sin2;

	sin1 = SinOsc.ar(MouseX.kr(20,20000), 0, MouseY.kr(1,10000));
	sin2 = SinOsc.ar(sin1 + 800, 0, 0.8);
	Out.ar(0, sin2);

}).add();
)

~synth = Synth(\synth);

~synth.free();