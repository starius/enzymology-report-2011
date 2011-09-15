set key off
set xlabel "S"
set ylabel "S/V"
set xtics 0.00005

s_v(s) = Km/Vm + 1/Vm * s
fit s_v(x) "10-Km.dat" using 1:($1/$2) via Vm, Km

plot "10-Km.dat" using 1:($1/$2), s_v(x)

print "Km = ", Km, " M"
print "Vm = ", Vm, " delta D/min"

