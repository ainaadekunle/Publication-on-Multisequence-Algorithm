set term postscript size 4.0,4.0 eps enhanced 14
set output "Stderr.eps"

#set size square
#set label "{/Times=24 HLX}" at graph 0.63,0.90
#set label "{/Times=24 N53I-T47I}" at graph 0.53,0.83

set bmargin 1.0
set tmargin 1.0
set rmargin 1.0
set lmargin 1.0

#set xtics format "" nomirror
#set mxtics 2 

#set style line 1 lt 3 lc rgb "black" lw 1 pt 7 ps .2 
#set style line 2 lt 2 lc rgb "black" lw 1 pt 7 ps .2
#set style line 3 lt 1 lc rgb "#A00000" lw 1 pt 7 ps .3
set style line 1 lt 3 lw 1 pt 4 ps 1
set style line 2 lt 3 lw 1 pt 6 ps 1
#set style line 1 lt 3  lc rgb "#A00000" lw 1 pt 7  ps 5
#set style line 2 lt 3 lc rgb "#6495ED" lw 1 pt 7 pi -1 ps 1
set style line 3 lt -1 lw 1.0 pt 4 ps 1.0
set style line 4 lt -1 lw 1.0 pt 7 ps 1.0
#set style line 4 lt 1 lc rgb "#5060D0" lw 1 pt 7 ps .3
#set style line 4 lt 1 lc rgb "gray" lw 1 pt 7 ps .3

if (!exists("MP_LEFT"))   MP_LEFT = .1
if (!exists("MP_RIGHT"))  MP_RIGHT = .95
if (!exists("MP_BOTTOM")) MP_BOTTOM = .1
if (!exists("MP_TOP"))    MP_TOP = .9
if (!exists("MP_GAP"))    MP_GAP = 0.08


############################
set multiplot layout 2, 2 columnsfirst title "{/Helvetica-Bold=14 }" font ",20"\
              margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_GAP
############################
#set size 0.85,0.30
#set origin 0.0,0.0
set ylabel offset 1.5,0.0
#set title "{/Helvetica-Bold=24 A}"


unset title
shiftx = 0.6 # manually adjust
shifty = 0.120
set label 1 "{/Helvetica=24 A}" at graph (0.5-shiftx),(1.125-shifty) left

set key samplen 2 spacing 1.5 font ",8"

set ylabel "{/Helvetica=18 {/Symbol s}_{<{/Times-Oblique=10 E}>} (10^{-2})}"
unset xlabel 


set ytics 0,10,45
set xtics 0.40,0.1,0.70
set mytics 1
set mxtics 1

set yrange[0:45]
set xrange[0.40:0.70]

p[:]"./SimTemp/A1/data2"  u 1:($13*100):($14*100)  with  yerrorbars t'{/Times=16 ST}'  ls 3,\
"./MultiSequence/A1" u 1:($13*100):($14*100)  with yerrorbars t'{/Times=16 MS}' ls 4,\
"./SimTemp/A1/data2"  u 1:($13*100) title "" with lines ls 1,\
"./MultiSequence/A1" u 1:($13*100) title "" with lines ls 2
############################
#set size 0.85,0.30
#set origin 0.0,0.0
#set ylabel offset 1.5,0.0

shiftx = 0.6 # manually adjust
shifty = 0.120
set label 1 "{/Helvetica=24 C}" at graph (0.5-shiftx),(1.125-shifty) left

set key
set ylabel "{/Helvetica=18 {/Symbol s}_{<{/Times-Oblique=10 E}>} (10^{-2})}"
set xlabel "{/Times-Oblique=18 k_{/Times-Roman=16 B}T}"


set ytics 0,20,110
set xtics 0.40,0.1,0.70
set mytics 1
set mxtics 1


set yrange[0:110]
set xrange[0.40:0.70]

p[:]"./SimTemp/R1/data2"  u 1:($13*100):($14*100)  with  yerrorbars t'{/Times=16 ST}'  ls 3,\
"./MultiSequence/R1" u 1:($13*100):($14*100)  with yerrorbars t'{/Times=16 MS}' ls 4,\
"./SimTemp/R1/data2"  u 1:($13*100) title "" with lines ls 1,\
"./MultiSequence/R1" u 1:($13*100) title "" with lines ls 2
############################
#set size 0.85,0.30
#set origin 0.0,0.0
#set ylabel offset 0.0,0.0

shiftx = 0.6 # manually adjust
shifty = 0.120
set label 1 "{/Helvetica=24 B}" at graph (0.5-shiftx),(1.125-shifty) left

set key
unset ylabel 
unset xlabel 


set ytics 0,20,90
set xtics 0.40,0.1,0.70
set mytics 1
set mxtics 1

set yrange[0:90]
set xrange[0.40:0.70]

p[:]"./SimTemp/N1/data2"  u 1:($13*100):($14*100)  with  yerrorbars t'{/Times=16 ST}'  ls 3,\
"./MultiSequence/N1" u 1:($13*100):($14*100)  with yerrorbars t'{/Times=16 MS}' ls 4,\
"./SimTemp/N1/data2"  u 1:($13*100) title "" with lines ls 1,\
"./MultiSequence/N1" u 1:($13*100) title "" with lines ls 2
############################
#set size 0.85,0.30
#set origin 0.0,0.0
#set ylabel offset 0.0,0.0

shiftx = 0.6 # manually adjust
shifty = 0.120
set label 1 "{/Helvetica=24 D}" at graph (0.5-shiftx),(1.125-shifty) left

set key
unset ylabel 
set xlabel "{/Times-Oblique=18 k_{/Times-Roman=16 B}T}"


set ytics 0,10,45
set xtics 0.40,0.1,0.70
set mytics 1
set mxtics 1

set yrange[0:50]
set xrange[0.40:0.70]

p[:]"./SimTemp/R2/data2"  u 1:($13*100):($14*100)  with  yerrorbars t'{/Times=16 ST}'  ls 3,\
"./MultiSequence/R2" u 1:($13*100):($14*100)  with yerrorbars t'{/Times=16 MS}' ls 4,\
"./SimTemp/R2/data2"  u 1:($13*100) title "" with lines ls 1,\
"./MultiSequence/R2" u 1:($13*100) title "" with lines ls 2
############################
unset multiplot
############################

