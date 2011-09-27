set title "Координаты Хейнса"
set key off
set xlabel "S [mM]"
set ylabel "$\\frac{S}{V}$ [$\\frac{\\text{mM} \cdot \\text{min}}{\\text{µmol}}$]"

s_v(s) = Km/Vm + 1/Vm * s
fit s_v(x) data using 1:($1/$3) via Vm, Km

set yrange [0:*]
set xrange [-0.001*Km:*]
set grid

plot data using (0.001*$1):(0.001*$1/$3), s_v(x*1000)/1000

load "print.inc"

