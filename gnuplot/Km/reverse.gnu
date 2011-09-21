set key off
set xlabel "$\\frac{1}{S}$ [$\\frac{1}{\\text{µM}}$]"
set ylabel "$\\frac{1}{V}$ [$\\frac{\\text{min}}{\\Delta D}$]"

v_1(s_1) = 1/Vm + Km/Vm * s_1
fit v_1(x) data using (1/$1):(1/$2) via Vm, Km

plot data using (1/$1):(1/$2), v_1(x)

print "Km = ", Km, " µM"
print "Vm = ", Vm, " delta D/min"

