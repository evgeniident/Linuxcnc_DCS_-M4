# --- Output ---

# Включение шпинделя
net spindle-on => hm2_5i25.0.7i77.0.0.output-01
# Включение очистки
net spindle-clean-air-cmd => hm2_5i25.0.7i77.0.0.output-02
# Расжим цанги
net open-collet => hm2_5i25.0.7i77.0.0.output-03

net estop-loop => hm2_5i25.0.7i77.0.0.output-00

# --- Input ---

net x-home-sw   <= hm2_5i25.0.7i77.0.0.input-16-not
net y-home-sw   <= hm2_5i25.0.7i77.0.0.input-17-not
net z-home-sw   <= hm2_5i25.0.7i77.0.0.input-19-not
net z-neg-limit <= hm2_5i25.0.7i77.0.0.input-18-not
net x-neg-limit <= hm2_5i25.0.7i77.0.0.input-20-not
net y-neg-limit <= hm2_5i25.0.7i77.0.0.input-22-not
net probe-in    <= hm2_5i25.0.7i77.0.0.input-21
