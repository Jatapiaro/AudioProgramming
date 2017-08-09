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
{SinOsc.ar()}.play(); //ar = audio rate
// the {} means that we have a function, and all respond to the method play
// [cmd + .] stop the production of signals in the server
{SinOsc.ar( 400, 0, 0.5 ) }.play();