shader_type canvas_item;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec3 draw_color : source_color = vec3(1.0);
uniform bool alpha;

float circle(in vec2 _st, in float _radius){
    vec2 dist = _st-vec2(0.5);
	return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(dist,dist)*4.0);
}

void fragment(){
	vec2 st = UV;
	
	vec3 color = vec3(circle(st,0.95));
	
	float check_color = 0.1;
	vec4 output_color = vec4(color, 1);
	if (output_color.r > check_color && output_color.g > check_color && output_color.b > check_color){
		output_color = vec4(draw_color,1);
	}
	else{if (alpha == true){output_color = vec4(draw_color,0);}}
	
	COLOR = output_color;
}
