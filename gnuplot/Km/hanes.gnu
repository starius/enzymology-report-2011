set key off
set xlabel "S [µM]"
set ylabel "$\\frac{S}{V}$ [$\\frac{\\text{µM} \cdot \\text{min}}{\\text{µmol}}$]"

s_v(s) = Km/Vm + 1/Vm * s
fit s_v(x) data using 1:($1/$3) via Vm, Km

set yrange [0:*]
set xrange [-Km:*]
set grid

plot data using 1:($1/$3), s_v(x)

load "print.inc"

