set key left box
set xlabel "mg of F"
set ylabel "delta D / min"
set xtics 0.001

f(x) = a * x + b
fit f(x) "9-2-D.dat" using (32.7*0.001*0.01*$1):2 via a, b

plot "9-2-D.dat" using (32.7*0.001*0.01*$1):2:1 with labels title "exp",\
    f(x) title "approx"

print "delta D/(min * mg) = ", a

