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

;;;;;;;;;;;;
; Instruments 2-4, generation of noise via chaos. Illustration of effect of step size and iskip
;;;;;;;;;;;;

; Instrument 2 ;iskip = 3, kh = .0001
instr 2
  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil 13500, 10, 1

  ; Initialize the attractor parameters (using traditional values
  ; of ks = 10 (sigma), kr = 28 (rho), and kb = 8/3 (beta)
  ksv init 10
  krv init 28
  kbv init 2.667
  kh init 0.0001 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 3
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



; Instrument 3 ;iskip = 4, kh = .001
instr 3
  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil 13500, 10, 1

  ; Initialize the attractor parameters (using traditional values
  ; of ks = 10 (sigma), kr = 28 (rho), and kb = 8/3 (beta)
  ksv init 10
  krv init 28
  kbv init 2.667
  kh init 0.001 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 4
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

; Instrument 4 ;iskip = 5, kh = .01
instr 4
  ; An oscillator corresponding to wave table 1 (sine)

  aout1 oscil 13500, 10, 1

  ; Initialize the attractor parameters (using traditional values
  ; of ks = 10 (sigma), kr = 28 (rho), and kb = 8/3 (beta)
  ksv init 10
  krv init 28
  kbv init 2.667
  kh init 0.01 ; step size
  ix = 1 ; initial x coord
  iy = 1 ; initial y coord
  iz = 1 ; initial z coord
  iskip = 4
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


</CsInstruments>
<CsScore>

; Wave table for a sine wave.
f 1 0 16384 10 1

; Score
; instrument number, start time, duration

; Uncomment to play
i 1 0 15 ; simple example of Lorenz 
;i 2 0 15 ; iskip = 3, kh = .0001
;i 3 0 15 ; iskip = 4, kh = .001
;i 4 0 15 ; iskip = 5, kh = .01 (very noisy)



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
