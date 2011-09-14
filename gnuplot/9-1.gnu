set xdata time
set timefmt "%M:%S"
set ylabel "D"
plot "9.dat" using 1:2 with linespoints title "30 µl неразбавленная альдолаза",\
     "9.dat" using 1:3 with linespoints title "30 µl разбавленная альдолаза",\
     "9.dat" using 1:4 with linespoints title "20 µl разбавленная альдолаза"

