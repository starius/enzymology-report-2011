set title "Электрофоретическое определение молекулярной массы белков"
set key off
set xlabel "ln M"
set ylabel "Rf"

data = "ef.dat"

f(x) = a * x + b
fit f(x) data using (log($1)):($2/780.0) via a, b
f_1(x) = (x - b) / a

set grid

plot data using (log($1)):($2/780.0), f(x)

print "M = ", sprintf("%.3g", exp(f_1(574.0/780.0)))

