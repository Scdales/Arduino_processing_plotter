# Arduino processing plotter
Plots integers received via serial

##Software:
###Processing 3
https://processing.org/download/

###Graphica
https://jagracar.com/grafica.php
You can download the library here, or install it via the menus inside of Processing.

Once you have found which serial COM port to use, edit the Serial.list() index in setup() to connect.

This script will plot any int on an XY graph, increase Y index by 1 on receipt of serial data and will auto scale.

Hit spacebar to reset the plot, scale, and zoom.

