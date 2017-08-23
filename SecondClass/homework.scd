s.boot();
s.quit();


(

SynthDef.new(\synth,{

	arg ampFreq = 1, freqFreq = 2, minRange = 0, maxRange = 200;
	var amp, freq, sig;

	amp = LFPar.kr(ampFreq);

	freq = LFCub.kr(freqFreq).exprange(minRange,maxRange);

	sig = Pulse.ar(freq, mul: amp);

	sig = FreeVerb.ar(sig);

	Out.ar(0,sig);

}).add();

SynthDef.new(\synth2,{
	arg freq = 1;
	var sig;
	sig = LFSaw.ar(freq, 0, 1);
	sig = SyncSaw.ar(freq, MouseX.kr(100, 150), 0.1);
	Out.ar(1,sig);
}).add();

SynthDef.new(\synth3,{
	arg mult = 0.5;
	var sig;
	sig = WhiteNoise.ar(mult);
	Out.ar(0,sig);
}).add();

SynthDef.new(\synth4,{

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




//inits
(
~synth = Synth.new(\synth, [\ampFreq, 1, \freqFreq, 2]);
~synth2 = Synth.new(\synth2);
~synth3 = Synth.new(\synth3, [\mult, 0.1]);
~synth4 = Synth.new(\synth4);
)


//synth one sets
(
~synth.set(\ampFreq,4);
~synth.set(\freqFreq,3);
~synth.set(\minRange,100);
~synth.set(\maxRange,200);
)

~synth3 = set(\mult, 4);

//synth four sets
(
~synth4.set(\ampHz,1);
)

//this sounds good
(
~synth2.free();
~synth3.free();
)

~synth.free();


//Frees
(
~synth.free();
~synth2.free();
~synth3.free();
~synth4.free();
)

