m = 8;
m;

s.boot

/*
Using client
*/
(
n = 7 + 8;
n.postln;
)

/*Using server*/

/*
SinOsc, is a unit generator
Object that produces signals
there are signals to produce sounds, signals
*/
{SinOsc.ar}.play //ar = audio rate
// the {} means that we have a function