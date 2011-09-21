set key off
set xlabel "V/S [$\\frac{\\Delta D}{\\text{min} \\cdot \\text{µM}}$]"
set ylabel "V [$\\frac{\\Delta D}{\\text{min}}$]

v(v_s) = Vm - Km * v_s
fit v(x) "10-Km.dat" using ($2/$1):2 via Vm, Km

plot "10-Km.dat" using ($2/$1):2, v(x)

print "Km = ", Km, " µM"
print "Vm = ", Vm, " delta D/min"

