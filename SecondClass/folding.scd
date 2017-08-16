s.boot();

{SinOsc.ar(MouseX.kr(20,300000), 0 ,0.5)}.play();

// kounter rate is 64 time slower than the audio rate
// audio rate is 44,100Hz
// so if audio rate runs at 44100Hz then kr its going to be 44100/64 = 689 Hz
