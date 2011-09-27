set title "Координаты Еди-Хофсти"
set key off
set xlabel "V/S [$\\frac{\\text{µmol}}{\\text{min} \\cdot \\text{mM}}$]"
set ylabel "V [$\\frac{\\text{µmol}}{\\text{min}}$]

v(v_s) = Vm - Km * v_s
fit v(x) data using ($3/$1):3 via Vm, Km

set yrange [0:*]
set xrange [0:Vm/(0.001*Km)]
set grid

plot data using ($3/(0.001*$1)):3, v(x/1000)

load "print.inc"

