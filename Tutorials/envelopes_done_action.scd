s.boot();

s.plotTree();

(
x = {
	arg t_gate = 0;
	var sig, env;
	env = EnvGen.kr(Env.new([0,1,0.2,0],[3,1,2],[12,-3,3]),
		t_gate, doneAction: 1);
	sig = Pulse.ar(ExpRand(110,550)) * env;
}.play();

y = {
	arg gate = 1;
	var sig,env;
	env = EnvGen.kr(Env.adsr, gate);
	sig = VarSaw.ar(SinOsc.kr(16).range(500,1000))*env;
}.play();
)

x.free();

//x.set(\gate, 1);
y.set(\gate, 0);

s.quit();

Env.new([1,0,0.2,0],[2,1,2],[12,-3,3]).plot;