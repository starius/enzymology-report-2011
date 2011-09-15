set key off
set xlabel "1/S"
set ylabel "1/V"

v_1(s_1) = 1/Vm + Km/Vm * s_1
fit v_1(x) "10-Km.dat" using (1/$1):(1/$2) via Vm, Km

plot "10-Km.dat" using (1/$1):(1/$2), v_1(x)

print "Km = ", Km, " M"
print "Vm = ", Vm, " delta D/min"

