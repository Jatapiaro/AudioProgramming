s.boot();


(

SynthDef.new(\synth,{
	arg noiseHz = 8;
	var freq, sig, amp;
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);
	amp = LFNoise2.kr(4).exprange(0.02, 1);
	sig = SinOsc.ar(freq) * amp;
	Out.ar(0,sig);
}).add();

SynthDef.new(\pulseTest,{

	arg fund = 40, maxPartial=4, ampHz = 4, width = 0.5;
	var freq1,freq2,sig1,sig2, amp1, amp2;

	amp1 = LFPulse.kr(ampHz,0,0.12)*0.75;
	amp2 = LFPulse.kr(ampHz,0.5,0.12)*0.75;

	freq1 = LFNoise1.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq1 = freq1 * LFPulse.kr(8, add:1);

	freq2 = LFNoise0.kr(4).exprange(fund, fund*maxPartial).round(fund);
	freq2 = freq2 * LFPulse.kr(6, add:1);

	sig1 = Pulse.ar(freq1,width,amp1);
	sig1 = FreeVerb.ar(sig1,0.7,0.8,0.25);

	sig2 = Pulse.ar(freq2, width, amp2);
	sig2 = FreeVerb.ar(sig2,0.7,0.8,0.25);

	Out.ar(0,sig1);
	Out.ar(1,sig2);

}).add();
)

~syn = Synth.new('\pulseTest', [\ampHz, 0.25, \fund, 30, \maxPartial, 20, \ampHz, 0.25]);
~syn.set(\width, 0.);
~syn.set(\fund, 44);
~syn.set(\ampHz, 3);
~syn.free();


s.quit();