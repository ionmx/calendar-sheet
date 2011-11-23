echo "Generating calendar days..."
# Do days
for d in {1..31}
do
  convert -background none -fill black -font Helvetica-Bold -pointsize 14 label:$d tmp/$d.png
done

# Do 365 days
for m in JAN FEB MAR APR MAY JUN JUL AGO SEP OCT NOV DEC
do
  convert -background none -fill white -font Helvetica-Bold -pointsize 8 label:$m tmp/tmp1.png
  composite -gravity center -geometry +0-7 tmp/tmp1.png bg.png tmp/tmp2.png
  for d in {1..31}
  do
    composite -gravity center -geometry +0+5 tmp/$d.png tmp/tmp2.png output/$m$d.png
  done
done
echo "Done."
