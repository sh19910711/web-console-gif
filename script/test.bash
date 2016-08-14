mkdir -p tmp/$1
$(npm bin)/coffee test/$1.coffee tmp/$1
convert -delay 35 -loop 0 tmp/$1/*.png tmp/$1.gif
