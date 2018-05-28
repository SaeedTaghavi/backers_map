set term png
set output 'plot.png'
set xlabel 'x'
set ylabel 'y'
p 'base' w p pt 7 lc 1, 'data01' w p pt 7 lc 2, 'data02' w p pt 7 lc 3, 'data03' w p pt 7 lc 4, 'data04' w p pt 7 lc 5, 'data05' w p pt 7 lc -1
