; A composition using the Lorenz attractor
; This system is approximated in Csound according
; to the following:

; x = x + h*(s*(y - x))
; y = y + h*(-x*z + r*x - y)
; z = z + h*(x*y - b*z)
      

<CsoundSynthesizer>
<CsOptions>
</CsOptions>
<CsInstruments>

; Global Variables
sr = 44100
kr = 44100
ksmps = 1
nchnls = 2


; Instrument 1, a classical Lorenz attractor
instr 1
  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil 13500, 1, 1

  ; Initialize the attractor parameters (using traditional values
  ; of ks = 10 (sigma), kr = 28 (rho), and kb = 8/3 (beta)
  ksv init 10
  krv init 28
  kbv init 2.667
  kh init 0.0003 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 2
  ax1, ay1, az1 lorenz ksv, krv, kbv, kh, ix, iy, iz, iskip
	
;;;;;;;;;;;;;	
; emulating a 3-d sound using spat3d
;;;;;;;;;;;;;  

  imode = 1 ; Specify mode of spat3d. Mode 1 corresponds "B-format" (speaker independent)
  idist = 5 ; 5 meters on unit circle
  ift = 0 ; no function table used for additional parameters of acoustic 	properties of the room (zero reflection)
  
  imdel = 2 ; max delay time (seconds)
  iovr = 2 ; Oversample ratio. spat3d documentation recommends a default of 2
  
  
  ; downsamp to convert audio rate signal to k-rate signal
  ; since spat3d uses k-rate variables for x, y, z
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1

  aw2, ax2, ay2, az2 spat3d aout1, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  
; Convert the 3D sound to stereo according to imode 1 design
  aleft = aw2 + ay2
  aright = aw2 - ay2

  outs aleft, aright
endin


; Instrument 2 
instr 2
  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil 13500, 10, 1

  ; Initialize the attractor parameters (using traditional values
  ; of ks = 10 (sigma), kr = 28 (rho), and kb = 8/3 (beta)
  ksv init 10
  krv init 28
  kbv init 2.667
  kh init p4 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 2
  ax1, ay1, az1 lorenz ksv, krv, kbv, kh, ix, iy, iz, iskip
	
;;;;;;;;;;;;;	
; emulating a 3-d sound using spat3d
;;;;;;;;;;;;;  

  imode = 1 ; Specify mode of spat3d. Mode 1 corresponds "B-format" (speaker independent)
  idist = 5 ; 5 meters on unit circle
  ift = 0 ; no function table used for additional parameters of acoustic 	properties of the room (zero reflection)
  
  imdel = 2 ; max delay time (seconds)
  iovr = 2 ; Oversample ratio. spat3d documentation recommends a default of 2
  
  
  ; downsamp to convert audio rate signal to k-rate signal
  ; since spat3d uses k-rate variables for x, y, z
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1

  aw2, ax2, ay2, az2 spat3d aout1, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  
; Convert the 3D sound to stereo according to imode 1 design
  aleft = aw2 + ay2
  aright = aw2 - ay2

  outs aleft, aright
endin


; Instrument 5 Oscil with amplitude modulated by Lorenz attractor
instr 5

  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil p4, p5, 1

  ; Initialize the attractor parameters (based on score p-fields)
  ksv init p7
  krv init p8
  kbv init p9
  kh init p6 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 2
  ax1, ay1, az1 lorenz ksv, krv, kbv, kh, ix, iy, iz, iskip
	
;;;;;;;;;;;;;	
; emulating a 3-d sound using spat3d
;;;;;;;;;;;;;  

  imode = 1 ; Specify mode of spat3d. Mode 1 corresponds "B-format" (speaker independent)
  idist = 5 ; 5 meters on unit circle
  ift = 0 ; no function table used for additional parameters of acoustic 	properties of the room (zero reflection)
  
  imdel = 2 ; max delay time (seconds)
  iovr = 2 ; Oversample ratio. spat3d documentation recommends a default of 2
  
  
  ; downsamp to convert audio rate signal to k-rate signal
  ; since spat3d uses k-rate variables for x, y, z
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1

  aw2, ax2, ay2, az2 spat3d aout1, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  
; Convert the 3D sound to stereo according to imode 1 design
  aleft = aw2 + ay2
  aright = aw2 - ay2
  
  aout2l oscil 10*aleft, 10, 1
  aout2r oscil 10*aright, 10, 1
  
  outs aout2l, aout2r
  
endin


; Instrument 6 Oscil with frequency given by Lorenz attractor
instr 6

  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil p4, p5, 1

  ; Initialize the attractor parameters (based on score p-fields)
  ksv init p7
  krv init p8
  kbv init p9
  kh init p6 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 2
  ax1, ay1, az1 lorenz ksv, krv, kbv, kh, ix, iy, iz, iskip
	
;;;;;;;;;;;;;	
; emulating a 3-d sound using spat3d
;;;;;;;;;;;;;  

  imode = 1 ; Specify mode of spat3d. Mode 1 corresponds "B-format" (speaker independent)
  idist = 5 ; 5 meters on unit circle
  ift = 0 ; no function table used for additional parameters of acoustic 	properties of the room (zero reflection)
  
  imdel = 2 ; max delay time (seconds)
  iovr = 2 ; Oversample ratio. spat3d documentation recommends a default of 2
  
  
  ; downsamp to convert audio rate signal to k-rate signal
  ; since spat3d uses k-rate variables for x, y, z
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1

  aw2, ax2, ay2, az2 spat3d aout1, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  
; Convert the 3D sound to stereo according to imode 1 design
  aleft = aw2 + ay2
  aright = aw2 - ay2
  
  aout2l oscil 1000, aleft, 1
  aout2r oscil 1000, aright, 1
  
  outs aout2l, aout2r
  
endin




; Instrument 7, a simple Lorenz attractor (with variable initial parameters)
instr 7
  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil p4, p5, 1

  ; Initialize the attractor parameters 
  ksv init p7
  krv init p8
  kbv init p9
  kh init 0.0003 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 2
  ax1, ay1, az1 lorenz ksv, krv, kbv, kh, ix, iy, iz, iskip
	
;;;;;;;;;;;;;	
; emulating a 3-d sound using spat3d
;;;;;;;;;;;;;  

  imode = 1 ; Specify mode of spat3d. Mode 1 corresponds "B-format" (speaker independent)
  idist = 5 ; 5 meters on unit circle
  ift = 0 ; no function table used for additional parameters of acoustic 	properties of the room (zero reflection)
  
  imdel = 2 ; max delay time (seconds)
  iovr = 2 ; Oversample ratio. spat3d documentation recommends a default of 2
  
  
  ; downsamp to convert audio rate signal to k-rate signal
  ; since spat3d uses k-rate variables for x, y, z
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1

  aw2, ax2, ay2, az2 spat3d aout1, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  
; Convert the 3D sound to stereo according to imode 1 design
  aleft = aw2 + ay2
  aright = aw2 - ay2

  outs aleft, aright
endin


; The following Planet instrument was not written by me. Citation:
; Mikelson, Hans. "Planet." Planet. 1 Dec. 1998. Web. <http://www.csounds.com/manual/html/planet.html>.



; Instrument #8 - a planet oribiting in 3D space.
instr 8
  ; Create a basic tone.
  kamp init 5000
  kcps init 440
  ifn = 1
  asnd oscil kamp, kcps, ifn

  ; Figure out its X, Y, Z coordinates.
  km1 init 0.5
  km2 init 0.35
  ksep init 2.2
  ix = 0
  iy = 0.1
  iz = 0
  ivx = 0.5
  ivy = 0
  ivz = 0
  ih = 0.0003
  ifric = -0.1
  ax1, ay1, az1 planet km1, km2, ksep, ix, iy, iz, \
                       ivx, ivy, ivz, ih, ifric

  ; Place the basic tone within 3D space.
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1
  idist = 1
  ift = 0
  imode = 1
  imdel = 1.018853416
  iovr = 2
  aw2, ax2, ay2, az2 spat3d asnd, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  ; Convert the 3D sound to stereo.
  aleft = aw2 + ay2
  aright = aw2 - ay2

  outs aleft, aright
endin

; Instrument #9 - a planet oribiting in 3D space. 
; This is a modified version of instrument #8 (p-fields introduced for variables)
instr 9
  ; Create a basic tone.
  kamp init 5000
  kcps init 440
  ifn = 1
  asnd oscil kamp, kcps, ifn

  ; Figure out its X, Y, Z coordinates.
  km1 init p6
  km2 init p7
  ksep init p8
  ix = 0
  iy = 0.1
  iz = 0
  ivx = 0.5
  ivy = 0
  ivz = 0
  ih = p4
  ifric = p5
  ax1, ay1, az1 planet km1, km2, ksep, ix, iy, iz, \
                       ivx, ivy, ivz, ih, ifric

  ; Place the basic tone within 3D space.
  kx downsamp ax1
  ky downsamp ay1
  kz downsamp az1
  idist = 1
  ift = 0
  imode = 1
  imdel = 1.018853416
  iovr = 2
  aw2, ax2, ay2, az2 spat3d asnd, kx, ky, kz, idist, \
                            ift, imode, imdel, iovr

  ; Convert the 3D sound to stereo.
  aleft = aw2 + ay2
  aright = aw2 - ay2

  outs aleft, aright
endin



</CsInstruments>
<CsScore>

; Wave table for a sine wave.
f 1 0 16384 10 1


; Lorenz examples

; instrument number, start time, duration
;i 1 0 15 ; simple Lorenz system

; Demo - Increasing step size

; instrument number, start time, duration, step size
;i 2 0 15 .0001 ; kh = .0001
;i 2 0 15 .001; kh = .001
;i 2 0 15 .01 ; kh = .01 (very noisy)

; Planet examples

; instrument number, start time, duration
;i 8 0 20 ; simple planet system

; Demo - Increasing the mass of sun 2
; instrument number, start time, duration, ih, ifriction, kmass1, kmass2, ksep
;i 9 0 10 .0003 -.1 .5 .35 2.2
;i 9 0 10 .0003 -.1 .5 .7 2.2
;i 9 0 10 .0003 -.1 .5 10 2.2
;i 9 0 10 .0003 -.1 .5 100 2.2

; Demo - Increasing the friction
; instrument number, start time, duration, ih, ifriction, kmass1, kmass2, ksep
;i 9 0 10 .0003 -.1 .5 .35 2.2
;i 9 0 10 .0003 5 .5 .35 2.2
;i 9 0 10 .0003 50 .5 .35 2.2


; Demo - Increasing the step size
; instrument number, start time, duration, ih, ifriction, kmass1, kmass2, ksep
;i 9 0 10 .0003 -.1 .5 .35 2.2
;i 9 0 10 .003 -.1 .5 .35 2.2
i 9 0 10 .01 -.1 .5 .35 2.2



; Main composition

; planet instruments
; instrument number, start time, duration, ih, ifriction, kmass1, kmass2, ksep

/*

i 9 0 6 .0003 -.1 .5 .35 2.2
i 9 12 4 .0003 -.1 2 6 2.2
i 9 22 4 .0003 -.1 12 3 2.2
i 9 35 4 .0003 -.1 .1 2.3 2.2
i 9 46 4 .0003 -.1 20 5 2.2
i 9 56 4 .0003 -.1 3.14 2.73 2.2
i 9 64 3 .0003 -.1 6.28 2.73 2.2

*/

; Lorenz instruments
; instrument number, start time, duration, amplitude, frequency, step size, sigma, rho, beta


/*

i 6 0 2 1000 123 .0001 12 3.1415 2.71828
i 6 2 2 1000 146 .0001 12 3.1415 2.71828
i 6 4 2 1000 192 .0001 12 3.1415 2.71828
i 6 6 2 1000 166 .0001 12 3.1415 2.71828
i 6 8 2 1000 123 .0001 12 3.1415 2.71828
i 6 9 2 1000 146 .0001 12 3.1415 2.71828
i 6 10 2 1000 192 .0001 12 3.1415 2.71828
i 6 11 2 1000 166 .0001 12 3.1415 2.71828
i 6 12 2 1000 146 .0001 12 3.1415 2.71828
i 6 13 4 1000 123 .0001 12 3.1415 2.71828
i 6 14 4 1000 146 .0001 12 3.1415 2.71828
i 6 15 4 1000 192 .0001 12 3.1415 2.71828
i 6 16 4 1000 166 .0001 12 3.1415 2.71828
i 6 17 4 1000 123 .0001 12 3.1415 2.71828
i 6 18 4 1000 146 .0001 12 3.1415 2.71828

i 5 0 2 1000 123 .0001 12 3.1415 2.71828
i 5 2 2 1000 146 .0001 12 3.1415 2.71828
i 5 4 2 1000 192 .0001 12 3.1415 2.71828
i 5 6 2 1000 166 .0001 12 3.1415 2.71828
i 5 8 2 1000 123 .0001 12 3.1415 2.71828
i 5 9 2 1000 146 .0001 12 3.1415 2.71828
i 5 10 2 1000 192 .0001 12 3.1415 2.71828
i 5 11 2 1000 166 .0001 12 3.1415 2.71828
i 5 12 2 1000 146 .0001 12 3.1415 2.71828
i 5 13 4 1000 123 .0001 12 3.1415 2.71828
i 5 14 4 1000 146 .0001 12 3.1415 2.71828
i 5 15 4 1000 192 .0001 12 3.1415 2.71828
i 5 16 4 1000 166 .0001 12 3.1415 2.71828
i 5 17 4 1000 123 .0001 12 3.1415 2.71828
i 5 18 4 1000 146 .0001 12 3.1415 2.71828

i 5 22 4 1000 123 .0001 12 3.1415 2.71828
i 5 26 4 1000 146 .0001 12 3.1415 2.71828
i 5 30 4 1000 192 .0001 12 3.1415 2.71828
i 5 34 4 1000 166 .0001 12 3.1415 2.71828
i 5 38 4 1000 123 .0001 12 3.1415 2.71828
i 5 42 4 1000 146 .0001 12 3.1415 2.71828
i 5 46 4 1000 192 .0001 12 3.1415 2.71828
i 5 50 4 1000 166 .0001 12 3.1415 2.71828
i 5 54 4 1000 146 .0001 12 3.1415 2.71828
i 5 60 4 1000 123 .0001 12 3.1415 2.71828
i 5 64 4 1000 146 .0001 12 3.1415 2.71828
i 5 68 4 1000 192 .0001 12 3.1415 2.71828

i 6 21 3 1000 1 .01 1 1 1
i 5 24 5 1000 800 .00001 7 3.1415 2.71828
i 5 29 4 2500 200 0.00001 1 10 90
i 5 33 3 1000 555 0.0001 10 28 2.667
i 6 35 3 1000 1 .01 1 1 1
i 5 38 5 1000 800 .00001 7 3.1415 2.71828
i 5 43 7 2500 200 0.00001 1 10 90
i 5 46 5 1000 800 .00001 7 3.1415 2.71828

i 5 50 5 2500 200 0.00001 1 10 90
i 5 52 5 1000 800 .00001 7 3.1415 2.71828
i 5 55 5 2500 200 0.00001 1 10 90

i 6 47 2 1000 192 .0001 12 3.1415 2.71828
i 6 48 2 1000 166 .0001 12 3.1415 2.71828
i 6 49 2 1000 146 .0001 12 3.1415 2.71828
i 6 50 4 1000 123 .0001 12 3.1415 2.71828
i 6 51 4 1000 146 .0001 12 3.1415 2.71828
i 6 52 4 1000 192 .0001 12 3.1415 2.71828
i 6 53 4 1000 166 .0001 12 3.1415 2.71828
i 6 54 4 1000 123 .0001 12 3.1415 2.71828
i 6 55 4 1000 146 .0001 12 3.1415 2.71828

i 7 62 1 3000 1 0.0003 10 28 5
i 7 63 1 3000 1 0.0003 10 28 4
i 7 64 1 3000 1 0.0003 10 28 3
i 7 65 1 3000 1 0.0003 10 28 2
i 7 66 1 3000 1 0.0003 10 28 1
i 7 67 1 3000 1 0.0003 10 25 2.667
i 7 68 1 3000 1 0.0003 8 20 2.667
i 7 69 1 3000 1 0.0003 6 15 2.667
i 7 70 1 3000 1 0.0003 4 10 2.667
i 7 71 1 3000 1 0.0003 2 5 2.667

*/

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
