s.boot();

//Save the funcion in soun variable
x = {SinOsc.ar};

y = x.play();

//This will try to free the function, not the synth
//thats why we create a second var to store the synth
x.free(); //<- this wont work

y.free();


/*
* Ugen are calculations wih signals
* ar -> audio rate
* kr -> counter rate
* ir -> inicialization rate
*/

/*
* ar, output values at the sample rate 44,000 samples per second.
* for hear a ugen sound or a high res wave form we use ar
*/

/*
* kr should be use for ugens to control other ugens
* control aplitude or frecuency of other ugens (audio rate oscilator for example)
*/

/*
* ir they calculate only one value (rarest)
*/

r = {SinOsc.ar(700,mul: 0.125)};
s = r.play();
s.free();

(
z = {
	arg freq=440, amp=1;
	var sig;
	sig = SinOsc.ar(freq)*amp;
}.play()
)

z.set(\freq, 330);
z.set(\amp, 0.125);
z.set(\freq, 660, \amp, 1);
z.set(\freq, 79.midicps, \amp, 550);
z.free();

s.quit();