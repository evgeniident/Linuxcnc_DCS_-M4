#*******************
#  AXIS Z
#*******************
loadrt pid names=pid.z
addf pid.z.do-pid-calcs servo-thread
setp   pid.z.Pgain     $::AXIS_2(P)
setp   pid.z.Igain     $::AXIS_2(I)
setp   pid.z.Dgain     $::AXIS_2(D)
setp   pid.z.bias      $::AXIS_2(BIAS)
setp   pid.z.FF0       $::AXIS_2(FF0)
setp   pid.z.FF1       $::AXIS_2(FF1)
setp   pid.z.FF2       $::AXIS_2(FF2)
setp   pid.z.deadband  $::AXIS_2(DEADBAND)
setp   pid.z.maxoutput $::AXIS_2(MAX_OUTPUT)

net z-index-enable  <=>  pid.z.index-enable
net z-enable       => pid.z.enable
net z-output       => pid.z.output
net z-pos-cmd      => pid.z.command
net z-vel-fb       => pid.z.feedback-deriv
net z-pos-fb       => pid.z.feedback

#*******************
#        AXIS Z
#*******************

# ---PWM Generator signals/setup---

setp hm2_5i25.0.7i77.0.2.analogout1-scalemax $::AXIS_2(OUTPUT_SCALE)
setp hm2_5i25.0.7i77.0.2.analogout1-minlim   $::AXIS_2(OUTPUT_MIN_LIMIT)
setp hm2_5i25.0.7i77.0.2.analogout1-maxlim   $::AXIS_2(OUTPUT_MAX_LIMIT)

net z-output => hm2_5i25.0.7i77.0.2.analogout1
#Эти строки должны жить здесь:
# LinuxCNC/axis-2.hal
#net z-pos-cmd    axis.2.motor-pos-cmd
#net z-enable     axis.2.amp-enable-out

# ---Encoder feedback signals/setup---

setp hm2_5i25.0.encoder.02.counter-mode 0
setp hm2_5i25.0.encoder.02.filter 1
setp hm2_5i25.0.encoder.02.index-invert 0
setp hm2_5i25.0.encoder.02.index-mask 0
setp hm2_5i25.0.encoder.02.index-mask-invert 0
setp hm2_5i25.0.encoder.02.scale $::AXIS_2(ENCODER_SCALE)

net z-pos-fb <= hm2_5i25.0.encoder.02.position
net z-vel-fb <= hm2_5i25.0.encoder.02.velocity
net z-index-enable <=> hm2_5i25.0.encoder.02.index-enable
net z-pos-rawcounts <= hm2_5i25.0.encoder.02.rawcounts
