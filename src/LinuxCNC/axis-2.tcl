#*******************
#  AXIS Z
#*******************

net z-enable  <= axis.2.amp-enable-out
net z-pos-cmd <= axis.2.motor-pos-cmd
net z-pos-fb  => axis.2.motor-pos-fb
net y-index-enable <=> axis.1.index-enable

#  ---home signals---
net z-home-sw  => axis.2.home-sw-in
net max-home-z => axis.2.home-sw-in
net max-home-z => axis.2.pos-lim-sw-in
