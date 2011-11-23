[[ -n "$1" ]] || { echo "Usage: ./calendar-sheet.sh [output directory]"; exit 0 ; }

OUTPUT=$1
[[ -d $OUTPUT ]] || { echo "Output directory doesn't exists"; exit 0; }

echo "Generating calendar days..."
# Do days
for d in {1..31}
do
  convert -background none -fill black -font Helvetica-Bold -pointsize 14 label:$d $OUTPUT/tmp_$d.png
done

# Do 365 days
for m in JAN FEB MAR APR MAY JUN JUL AGO SEP OCT NOV DEC
do
  convert -background none -fill white -font Helvetica-Bold -pointsize 8 label:$m $OUTPUT/tmp1.png
  composite -gravity center -geometry +0-7 $OUTPUT/tmp1.png bg.png $OUTPUT/tmp2.png
  for d in {1..31}
  do
    composite -gravity center -geometry +0+5 $OUTPUT/tmp_$d.png $OUTPUT/tmp2.png $OUTPUT/$m$d.png
  done
done
rm $OUTPUT/tmp*
echo "Done."
