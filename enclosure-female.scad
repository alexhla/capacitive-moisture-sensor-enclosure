$fn = 64;

SMSFemaleBase();
translate([6.5,0,-5]){screwMount();}

module SMSFemaleBase(){
    difference(){
        ////////////////////////////////////////////
        //// SMS Female Base Additive Union
        union(){
            // enclosure starting block
            minkowski(){
                cube([34,22,7], center=true);
                sphere(2);
            }
        }
        ////////////////////////////////////////////
        //// SMS Female Base Subtractive Union       
        union(){
            // hollow inside with a wall thickness of 2
            translate([0,0,0]){
                minkowski(){
                    cube([33,21,5], center=true);
                    sphere(1);
                }
            }
            // mating (female) lip edge of 1.5
            translate([0,0,0.5]){ 
                linear_extrude(2){
                    minkowski(){
                        square([34,22], center=true);
                        circle(1.25);
                    }
                }
            }             
            // wire hole
            translate([18.25,0,2]){
                sphere(1.75, center=true);
            }
            // PCB slot
            translate([-18,0,2]){
                cube([4, 20, 1], center=true);
            }
            // flatten mating side
            translate([0,0,4.5]){
                cube([39,27,5], center=true);
            }          
        }
    } // end: difference() 
} // end: module SMSFemaleBase


//////////////////////////////////////////////////
//// Screw Mount
module screwMount(){
    difference(){
        ////////////////////////////////////////////
        //// Screw Mount Additive Union
        union(){
            // post
            cylinder(r=3.5, h=7);
            // fillet
            translate([0,0,1]){
                rotate_extrude(convexity=10){
                    translate([3,0]){
                        intersection(){
                            square(6);
                            difference(){
                                square(6, center=true);
                                translate([3,3]){
                                    circle(3);
                                }
                            }   
                        }    
                    }
                }
            }
        }
        ////////////////////////////////////////////
        //// Screw Mount Subtractive Union       
        union(){
            // screw hole
            cylinder(r=1.25, h=7.5); 
        }
    }     
}