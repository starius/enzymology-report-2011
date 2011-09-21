set key off
set xlabel "S [µM]"
set ylabel "V [$\\frac{\\Delta D}{\\text{min}}$]"
set xtics 50

v(x) = Vm * x / (Km + x)
fit v(x) data using 1:2 via Vm, Km

plot data using 1:2, v(x)
print "Km = ", Km, " µM"
print "Vm = ", Vm, " delta D/min"

