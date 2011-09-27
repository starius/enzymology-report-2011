set key off
set xlabel "S [µM]"
set ylabel "V [$\\frac{\\text{µmol}}{\\text{min}}$]"

v(x) = Vm * x / (Km + x)
fit v(x) data using 1:3 via Vm, Km

set yrange [0:*]
set grid

plot data using 1:3, v(x)

load "print.inc"

