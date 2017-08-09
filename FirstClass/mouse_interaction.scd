//Let's interact with the mouse

{ SinOsc.ar( MouseX.kr(20,20000), 0, 0.8 ) }.play()

{ SinOsc.ar(400, 0, 1)+SinOsc.ar(400, MouseX.kr(0.0, pi), 1) }.play