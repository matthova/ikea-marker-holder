//
//  Hexagonal grid generator
//  Joris Bots - August 2020
//

/* [Global] */
// length of a hexagon side 
s = 6.3;   //[1:20] 
// distance between hexagons (grid width )
d = 3;   //[0.5:10] 
// number of hexagons in x direction (even numbers only!)
x = 19;  //[2:100]
// number of hexagons in y direction (even numbers only!)
y = 7;  //[2:100]
// height of the grid plate
h = 31;   //[1:10]

translate([3 + 6 + 0.5, 3 + 5+6.7/2, 0])
difference(){
    translate([-s-(hexvspace()) + 1, -(hexheight()/2)-hexhspace() - 7/2,0])
    //cube([hexhspace()+x*hexhdist()+s/2, (hexvspace()+hexheight()/2)+hexvspace()/2+((hexheight() + hexvspace() ) * y/2),h]);

    linear_extrude(height = h)
    offset(r = 0.2)
    square([233.96 - 0.4, 65.0875 - 0.4]);
    

    for (j = [1:2:y]){
        for (i = [1:2:x]){
            if (j != y) {
                translate([(s+(s/2)+hexhspace())*(i-1),(hexheight()/2+d/2)*j - 1])hex(s);
            }
            if (i != x) {
                translate([(s+(s/2)+hexhspace())*i,(hexheight()/2+d/2)*(j-1)])hex(s);
            }
        }
    }
}

module hex(l){
    $fn = 64;
    linear_extrude(h + 2)circle(l + 0.1);
}

function hexheight() = sqrt(3)*(s);       // vertical height of a hex
function hexvspace() = d;                 // vertical space between two hex
function hexhspace() = sqrt(3)*d/2;       // horizontal space between two hex
function hexhdist()  = 1.5*s+hexhspace(); // horizontal distance between two hex centres
