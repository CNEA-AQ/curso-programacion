set title "Interpolación"
set ylabel "f(x)"
set xlabel "x"

puntos="points.txt"
interp="interpolacion.txt"

set terminal x11 0
set multiplot
set nokey
set grid

set xrange [0:5]
set yrange [-50:250]

#u:using; w:with
plot exp(x)*cos(3*x**2) w lines lw 3
plot puntos u 1:2 w points pt 8 ps 2 
plot interp u 1:2 w lines title "L(x)" lw 1 lt 1 lc rgb "#f01010"
plot interp u 1:3 w lines title "N(x)" lw 2 lt 2 lc rgb "#f010f0"
plot interp u 1:4 w lines title "H(x)" lw 2 lt 3 lc rgb "#1010f0"
plot interp u 1:5 w lines title "S(x)" lw 2 lt 4 lc rgb "#10f010"

