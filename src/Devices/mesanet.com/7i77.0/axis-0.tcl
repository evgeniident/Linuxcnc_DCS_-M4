#*******************
#  AXIS X
#*******************
net x-enable => axis.0.amp-enable-out 
net x-pos-cmd => axis.0.motor-pos-cmd
net x-pos-fb => axis.0.motor-pos-fb
net x-index-enable <=> axis.0.index-enable
# ---setup home / limit switch signals--- 
net x-home-sw => axis.0.home-sw-in
net x-neg-limit => axis.0.neg-lim-sw-in
net x-pos-limit => axis.0.pos-lim-sw-in



loadrt pid names=pid.x
addf pid.x.do-pid-calcs servo-thread
setp   pid.x.Pgain     S::AXIS_0(P)
setp   pid.x.Igain     S::AXIS_0(I)
setp   pid.x.Dgain     S::AXIS_0(D)
setp   pid.x.bias      S::AXIS_0(BIAS)
setp   pid.x.FF0       S::AXIS_0(FF0)
setp   pid.x.FF1       S::AXIS_0(FF1)
setp   pid.x.FF2       S::AXIS_0(FF2)
setp   pid.x.deadband  S::AXIS_0(DEADBAND)
setp   pid.x.maxoutput S::AXIS_0(MAX_OUTPUT)

net x-index-enable  <=>  pid.x.index-enable
net x-enable       => pid.x.enable
net x-output       => pid.x.output
net x-pos-cmd      => pid.x.command
net x-vel-fb       => pid.x.feedback-deriv
net x-pos-fb       => pid.x.feedback

#*******************
#        AXIS X
#*******************

#net hm2_5i25.0.7i77.0.1.analogena x-enable 

# ---PWM Generator signals/setup---

setp hm2_5i25.0.7i77.0.1.analogout0-scalemax S::AXIS_0(OUTPUT_SCALE)
setp hm2_5i25.0.7i77.0.1.analogout0-minlim   S::AXIS_0(OUTPUT_MIN_LIMIT)
setp hm2_5i25.0.7i77.0.1.analogout0-maxlim   S::AXIS_0(OUTPUT_MAX_LIMIT)

net x-output => hm2_5i25.0.7i77.0.1.analogout0

# ---Encoder feedback signals/setup---

setp hm2_5i25.0.encoder.00.counter-mode 0
setp hm2_5i25.0.encoder.00.filter 1
setp hm2_5i25.0.encoder.00.index-invert 0
setp hm2_5i25.0.encoder.00.index-mask 0
setp hm2_5i25.0.encoder.00.index-mask-invert 0
setp hm2_5i25.0.encoder.00.scale S::AXIS_0(ENCODER_SCALE)

net x-pos-fb <= hm2_5i25.0.encoder.00.position
net x-vel-fb <= hm2_5i25.0.encoder.00.velocity
net x-index-enable <=> hm2_5i25.0.encoder.00.index-enable
net x-pos-rawcounts <= hm2_5i25.0.encoder.00.rawcounts
