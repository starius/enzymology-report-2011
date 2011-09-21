set key off
set xlabel "S [µM]"
set ylabel "$\\frac{S}{V}$ [$\\frac{\\text{µM} \cdot \\text{min}}{\\Delta D}$]"
set xtics 50

s_v(s) = Km/Vm + 1/Vm * s
fit s_v(x) "10-Km.dat" using 1:($1/$2) via Vm, Km

plot "10-Km.dat" using 1:($1/$2), s_v(x)

print "Km = ", Km, " µM"
print "Vm = ", Vm, " delta D/min"

