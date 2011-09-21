set key off
set xlabel "S [µM]"
set ylabel "$\\frac{S}{V}$ [$\\frac{\\text{µM} \cdot \\text{min}}{\\Delta D}$]"

s_v(s) = Km/Vm + 1/Vm * s
fit s_v(x) data using 1:($1/$2) via Vm, Km

plot data using 1:($1/$2), s_v(x)

print "Km = ", Km, " µM"
print "Vm = ", Vm, " delta D/min"

