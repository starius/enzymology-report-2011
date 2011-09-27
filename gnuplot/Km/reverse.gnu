set title "Координаты Лайнуивера-Берка"
set key off
set xlabel "$\\frac{1}{S}$ [$\\frac{1}{\\text{µM}}$]"
set ylabel "$\\frac{1}{V}$ [$\\frac{\\text{min}}{\\text{µmol}}$]"

v_1(s_1) = 1/Vm + Km/Vm * s_1
fit v_1(x) data using (1/$1):(1/$3) via Vm, Km

set yrange [0:*]
set xrange [-1/Km:*]
set grid

plot data using (1/$1):(1/$3), v_1(x)

load "print.inc"

