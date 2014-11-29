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


</CsInstruments>
<CsScore>


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
