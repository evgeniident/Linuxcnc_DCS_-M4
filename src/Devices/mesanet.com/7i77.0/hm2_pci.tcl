loadrt [lindex $::HOSTMOT2(DRIVER) 0] config=[lindex $::HOSTMOT2(CONFIG) 0]
#loadrt hm2_pci config="num_encoders=3 num_pwmgens=0 num_3pwmgens=0 num_stepgens=0"
# sserial_port_0=000xx  
#setp hm2_5i25.0.watchdog.timeout_ns 10000000

addf hm2_5i25.0.read servo-thread
addf hm2_5i25.0.write servo-thread
#addf hm2_5i25.0.pet_watchdog servo-thread
