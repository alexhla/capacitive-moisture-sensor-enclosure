$fn = 64;

SMSMaleBase();
translate([6.5,0,-5]){screwMount();}

module SMSMaleBase(){
    difference(){
        ////////////////////////////////////////////
        //// SMS Male Base Additive Union
        union(){
            // enclosure starting block
            minkowski(){
                cube([34,22,7], center=true);
                sphere(2);
            }
        }
        ////////////////////////////////////////////
        //// SMS Male Base Subtractive Union       
        union(){
            // hollow inside with a wall thickness of 2
            translate([0,0,0]){
                minkowski(){
                    cube([33,21,6], center=true);
                    sphere(1);
                }
            }
            // mating (male) lip edge of 1.5
            translate([0,0,2]){ 
                difference(){
                    linear_extrude(2){
                        minkowski(){
                            square([37,25], center=true);
                            circle(1);
                        }
                    }        
                    
                    linear_extrude(2){
                        minkowski(){
                            square([34,22], center=true);
                            circle(1);
                        }
                    }
                }    
            }            
            // wire hole
            translate([18.25,0,3.5]){
                sphere(1.75, center=true);
            }
            // PCB slot
            translate([-18,0,2.5]){
                cube([4, 20, 2.5], center=true);
            }
            // screw inlet
            translate([6.5,0,-6]){
                cylinder(r=1.75, h=5);    
            }
            // screw head slot
            translate([6.5,0,-6]){
                difference(){
                    cylinder(r=3, h=2);
                    cylinder(r=1.75, h=2.5);    
                }
            }
            // flatten mating side
            translate([0,0,6]){
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
            translate([0,0,0.5]){cylinder(r=4, h=6);}
            // fillet
            translate([0,0,0.75]){
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
            cylinder(r=1.75, h=7); 
        }
    }     
}