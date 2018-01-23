set term postscript size 4.0,4.0 eps enhanced color 14
set output "meanE.eps"

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
set style line 1 lt 3 lc rgb "#A00000" lw 1 pt 7 pi -1 ps 0.1
set style line 2 lt 1 lc rgb "#6495ED" lw 1 pt 7 pi -1 ps 0.1
set style line 3 lt 1 lc rgb "#A00000" lw 1.5 pt 4 ps 1.0
set style line 4 lt 1 lc rgb "#6495ED" lw 1.5 pt 7 ps 1.0
#set style line 4 lt 1 lc rgb "#5060D0" lw 1 pt 7 ps .3
#set style line 4 lt 1 lc rgb "gray" lw 1 pt 7 ps .3

if (!exists("MP_LEFT"))   MP_LEFT = .1
if (!exists("MP_RIGHT"))  MP_RIGHT = .95
if (!exists("MP_BOTTOM")) MP_BOTTOM = .1
if (!exists("MP_TOP"))    MP_TOP = .9
if (!exists("MP_GAP"))    MP_GAP = 0.08


############################
set multiplot layout 2, 2 columnsfirst title "{/Helvetica-Bold=14 }" font ",14"\
              margins screen MP_LEFT, MP_RIGHT, MP_BOTTOM, MP_TOP spacing screen MP_GAP
############################
#set size 0.85,0.30
#set origin 0.0,0.0
set ylabel offset 1.5,0.0
#set title "{/Helvetica-Bold=24 A}"

unset bars

unset title
shiftx = 0.6 # manually adjust
shifty = 0.075
set label 1 "{/Helvetica-Bold=24 A}" at graph (0.5-shiftx),(1.125-shifty) left

#set key samplen 2 spacing 1.5 font ",8"

unset key
set ylabel "{<{/Helvetical-Oblique=12 E}>_{/Helvetical=10 ST}"
unset xlabel 

set ytics -5,5,25
set xtics -5,5,25
set mytics 1
set mxtics 1

set yrange[-10:30]
set xrange[-10:30]

p[:]"./A1ST_A1MS"  u 3:16:4:17  with  xyerrorbars  t'{/Times=12 ST}'  ls 3, x lt -1 t''
############################
#set size 0.85,0.30
#set origin 0.0,0.0
set ylabel offset 1.5,0.0
#set title "{/Helvetica-Bold=14 B}"

unset title
shiftx = 0.6 # manually adjust
shifty = 0.075
set label 1 "{/Helvetica-Bold=24 C}" at graph (0.5-shiftx),(1.125-shifty) left

#set key samplen 2 spacing 1.5 font ",8"

unset key
set ylabel "{<{/Helvetical-Oblique=12 E}>_{/Helvetical=10 ST}"
set xlabel "{<{/Helvetical-Oblique=12 E}>_{/Helvetical=10 MS}"

set ytics -5,5,25
set xtics -5,5,25
set mytics 1
set mxtics 1

set yrange[-10:30]
set xrange[-10:30]

p[:]"./R1ST_R1MS"  u 3:16:4:17  with  xyerrorbars  t'{/Times=12 ST}'  ls 3, x lt -1 t''
############################
#set size 0.85,0.30
#set origin 0.0,0.0
set ylabel offset 1.5,0.0
#set title "{/Helvetica-Bold=14 A}"

unset title
shiftx = 0.6 # manually adjust
shifty = 0.075
set label 1 "{/Helvetica-Bold=24 B}" at graph (0.5-shiftx),(1.125-shifty) left

#set key samplen 2 spacing 1.5 font ",8"

unset key
set ylabel 
unset xlabel 

set ytics -5,5,25
set xtics -5,5,25
set mytics 1
set mxtics 1

set yrange[-10:30]
set xrange[-10:30]

p[:]"./N1ST_N1MS"  u 3:16:4:17  with  xyerrorbars  t'{/Times=12 ST}'  ls 3, x lt -1 t''
############################
#set size 0.85,0.30
#set origin 0.0,0.0
set ylabel offset 1.5,0.0
#set title "{/Helvetica-Bold=14 A}"

unset title
shiftx = 0.6 # manually adjust
shifty = 0.075
set label 1 "{/Helvetica-Bold=24 D}" at graph (0.5-shiftx),(1.125-shifty) left

#set key samplen 2 spacing 1.5 font ",8"

unset key
unset ylabel 
set xlabel "{<{/Helvetical-Oblique=12 E}>_{/Helvetical=10 MS}"

set ytics -5,5,25
set xtics -5,5,25
set mytics 1
set mxtics 1

set yrange[-10:30]
set xrange[-10:30]

p[:]"./R2ST_R2MS"  u 3:16:4:17  with  xyerrorbars  t'{/Times=12 ST}'  ls 3, x lt -1 t''
############################

