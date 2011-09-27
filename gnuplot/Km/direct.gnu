set key off
set xlabel "S [µM]"
set ylabel "V [$\\frac{\\Delta D}{\\text{min}}$]"

v(x) = Vm * x / (Km + x)
fit v(x) data using 1:2 via Vm, Km

set yrange [0:*]
set grid

plot data using 1:2, v(x)
print "Km = ", Km, " µM; "
print "Vm = ", Vm, " delta D/min"

