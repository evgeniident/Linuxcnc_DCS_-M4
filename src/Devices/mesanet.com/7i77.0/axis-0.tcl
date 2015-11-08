#*******************
#  AXIS X
#*******************
loadrt pid names=pid.x
addf pid.x.do-pid-calcs servo-thread
setp   pid.x.Pgain     [lindex S::AXIS_0(P) 0]
setp   pid.x.Igain     [lindex S::AXIS_0(I) 0]
setp   pid.x.Dgain     [lindex S::AXIS_0(D) 0]
setp   pid.x.bias      [lindex S::AXIS_0(BIAS) 0]
setp   pid.x.FF0       [lindex S::AXIS_0(FF0) 0]
setp   pid.x.FF1       [lindex S::AXIS_0(FF1) 0]
setp   pid.x.FF2       [lindex S::AXIS_0(FF2) 0]
setp   pid.x.deadband  [lindex S::AXIS_0(DEADBAND) 0]
setp   pid.x.maxoutput [lindex S::AXIS_0(MAX_OUTPUT) 0]

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

setp hm2_5i25.0.7i77.0.1.analogout0-scalemax [lindex S::AXIS_0(OUTPUT_SCALE) 0]
setp hm2_5i25.0.7i77.0.1.analogout0-minlim   [lindex S::AXIS_0(OUTPUT_MIN_LIMIT) 0]
setp hm2_5i25.0.7i77.0.1.analogout0-maxlim   [lindex S::AXIS_0(OUTPUT_MAX_LIMIT) 0]

net x-output => hm2_5i25.0.7i77.0.1.analogout0
#Эти строки должны жить здесь:
# LinuxCNC/axis-0.hal
#net x-pos-cmd    axis.0.motor-pos-cmd
#net x-enable     axis.0.amp-enable-out

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
