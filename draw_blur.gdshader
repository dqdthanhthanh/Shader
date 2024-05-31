shader_type canvas_item;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec3 draw_color : source_color = vec3(1.0);
uniform bool alpha;

void fragment(){
	vec2 st = UV;
    float pct = 0.0;

    // a. The DISTANCE from the pixel to the center
    pct = distance(st,vec2(0.5));

    // b. The LENGTH of the vector
    //    from the pixel to the center
    // vec2 toCenter = vec2(0.5)-st;
    // pct = length(toCenter);

    // c. The SQUARE ROOT of the vector
    //    from the pixel to the center
    // vec2 tC = vec2(0.5)-st;
    // pct = sqrt(tC.x*tC.x+tC.y*tC.y);

    vec3 color = vec3(pct);

	COLOR = vec4( color, 1.0 );
}
