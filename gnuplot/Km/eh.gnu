set key off
set xlabel "V/S [$\\frac{\\text{µmol}}{\\text{min} \\cdot \\text{µM}}$]"
set ylabel "V [$\\frac{\\text{µmol}}{\\text{min}}$]
set xtics rotate by -90

v(v_s) = Vm - Km * v_s
fit v(x) data using ($3/$1):3 via Vm, Km

set yrange [0:*]
set xrange [0:Vm/Km]
set grid

plot data using ($3/$1):3, v(x)

load "print.inc"

