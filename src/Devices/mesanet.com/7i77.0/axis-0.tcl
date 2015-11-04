#*******************
#  AXIS X
#*******************
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
setp hm2_5i25.0.encoder.00.scale [lindex S::AXIS_0(ENCODER_SCALE) 0]

net x-pos-fb <= hm2_5i25.0.encoder.00.position
net x-vel-fb <= hm2_5i25.0.encoder.00.velocity
net x-index-enable <=> hm2_5i25.0.encoder.00.index-enable
net x-pos-rawcounts <= hm2_5i25.0.encoder.00.rawcounts
