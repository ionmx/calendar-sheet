# Do months
echo "Creating months..."
for m in JAN FEB MAR APR MAY JUN JUL AGO SEP OCT NOV DEC
do
  convert -background none -fill white -font Helvetica-Bold -pointsize 8 label:$m tmp/$m.png
done

# Do days
echo "Creating days..."
for d in {1..31}
do
  convert -background none -fill black -font Helvetica-Bold -pointsize 14 label:$d tmp/$d.png
done

# Do 365 days
for m in JAN FEB MAR APR MAY JUN JUL AGO SEP OCT NOV DEC
do
  for d in {1..31}
  do
    echo "Creating $m $d image..."
    composite -gravity center -geometry +0-7 tmp/$m.png bg.png tmp/tmp.png
    composite -gravity center -geometry +0+5 tmp/$d.png tmp/tmp.png output/$m$d.png
  done
done
