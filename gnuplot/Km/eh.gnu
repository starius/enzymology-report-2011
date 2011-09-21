set key off
set xlabel "V/S [$\\frac{\\Delta D}{\\text{min} \\cdot \\text{µM}}$]"
set ylabel "V [$\\frac{\\Delta D}{\\text{min}}$]
set xtics rotate by -90

v(v_s) = Vm - Km * v_s
fit v(x) data using ($2/$1):2 via Vm, Km

plot data using ($2/$1):2, v(x)

print "Km = ", Km, " µM"
print "Vm = ", Vm, " delta D/min"

