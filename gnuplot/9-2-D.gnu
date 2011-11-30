set key off
set xlabel "количество (в mg) альдолазы"
set ylabel "$\\frac{\\Delta D}{\\text{min}}$"
set xtics 0.001

f(x) = a * x + b
fit f(x) "9-2-D.dat" using (32.7*0.001*0.01*$1):2 via a, b

plot "9-2-D.dat" using (32.7*0.001*0.01*$1):2:(sprintf("%i µl", $1)) with labels title "exp",\
    f(x) title "approx"

print "delta D/(min * mg) = ", a

