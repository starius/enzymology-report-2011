set key left bottom box
set xdata time
set timefmt "%M:%S"
set ylabel "D"
set xlabel "время от включения прибора"
set xtics "1:00"
plot "9.dat" using 1:5 with linespoints title "20 µl альдолазы",\
     "9.dat" using 1:6 with linespoints title "10 µl альдолазы",\
     "9.dat" using 1:7 with linespoints title "5 µl альдолазы"

