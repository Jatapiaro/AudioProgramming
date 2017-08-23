s.boot();

(
z = {
	arg noiseHz = 8;
	var freq, sig, amp;
	//freq is the 8 value per second
	//freq = LFNoise0.kr(12,400,600);
	//freq = LFNoise0.kr(8).range(200,1000);
	/*
	* humans percibe sound exponencially
	* is recommended that especifies a renge with
	* exponencial values
	*/
	freq = LFNoise0.kr(noiseHz).exprange(200,1000);
	amp = LFNoise2.kr(4).exprange(0.02, 1);
	//always multiply amplitude
	sig = SinOsc.ar(freq) * amp;
}.play();
)

z.set(\noiseHzn , exprand(4,64));
z.free();

s.quit();