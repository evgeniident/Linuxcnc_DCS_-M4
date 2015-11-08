#*******************
#  AXIS Y
#*******************
loadrt pid names=pid.y
addf pid.y.do-pid-calcs servo-thread
setp   pid.y.Pgain     S::AXIS_1(P)
setp   pid.y.Igain     S::AXIS_1(I)
setp   pid.y.Dgain     S::AXIS_1(D)
setp   pid.y.bias      S::AXIS_1(BIAS)
setp   pid.y.FF0       S::AXIS_1(FF0)
setp   pid.y.FF1       S::AXIS_1(FF1)
setp   pid.y.FF2       S::AXIS_1(FF2)
setp   pid.y.deadband  S::AXIS_1(DEADBAND)
setp   pid.y.maxoutput S::AXIS_1(MAX_OUTPUT)

net y-index-enable  <=>  pid.y.index-enable
net y-enable       => pid.y.enable
net y-output       => pid.y.output
net y-pos-cmd      => pid.y.command
net y-vel-fb       => pid.y.feedback-deriv
net y-pos-fb       => pid.y.feedback

#*******************
#        AXIS Y
#*******************

# ---PWM Generator signals/setup---

setp hm2_5i25.0.7i77.0.1.analogout1-scalemax S::AXIS_1(OUTPUT_SCALE)
setp hm2_5i25.0.7i77.0.1.analogout1-minlim   S::AXIS_1(OUTPUT_MIN_LIMIT)
setp hm2_5i25.0.7i77.0.1.analogout1-maxlim   S::AXIS_1(OUTPUT_MAX_LIMIT)

net y-output => hm2_5i25.0.7i77.0.1.analogout1
net y-pos-cmd    axis.1.motor-pos-cmd
net y-enable     axis.1.amp-enable-out

# ---Encoder feedback signals/setup---

setp hm2_5i25.0.encoder.01.counter-mode 0
setp hm2_5i25.0.encoder.01.filter 1
setp hm2_5i25.0.encoder.01.index-invert 0
setp hm2_5i25.0.encoder.01.index-mask 0
setp hm2_5i25.0.encoder.01.index-mask-invert 0
setp hm2_5i25.0.encoder.01.scale S::AXIS_1(ENCODER_SCALE)

net y-pos-fb <= hm2_5i25.0.encoder.01.position
net y-vel-fb <= hm2_5i25.0.encoder.01.velocity
net y-index-enable <=> hm2_5i25.0.encoder.01.index-enable
net y-pos-rawcounts <= hm2_5i25.0.encoder.01.rawcounts
