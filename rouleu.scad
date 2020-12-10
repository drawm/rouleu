size=45;
height=3.5;
$fn=20;

union(){
scale([2,2,1])
roundedcube([size/2,size/2,height], true, 1.7);

scale([.95,.95,1])
  union(){
    bulge_height=height/3;
    translate([0,0,height/2])
    rotate([0,0,45/2])
    cylinder(h=bulge_height, r1=size/2, r2=0, $fn=8);

    translate([0,0,-height/2])
    rotate([180,0,45/2])
    cylinder(h=bulge_height, r1=size/2, r2=0, $fn=8);
  }

}


module roundedcube(size = [1, 1, 1], center = false, radius = 0.5) {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate = (center == false) ?
		[radius, radius, radius] :
		[
			radius - (size[0] / 2),
			radius - (size[1] / 2),
			radius - (size[2] / 2)
	];

	translate(v = translate)
	minkowski() {
		cube(size = [
			size[0] - (radius * 2),
			size[1] - (radius * 2),
			size[2] - (radius * 2)
		]);
		sphere(r = radius);
	}
}
