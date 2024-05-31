shader_type canvas_item;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec3 draw_color : source_color = vec3(1.0);
uniform int title = 3;
uniform bool alpha;

float circle(in vec2 _st, in float _radius){
    vec2 l = _st-vec2(0.5);
    return 1.-smoothstep(_radius-(_radius*0.01),
                         _radius+(_radius*0.01),
                         dot(l,l)*4.0);
}

void fragment() {
	vec2 st = UV;
    vec3 color = vec3(0.0);

    st *= float(title);      // Scale up the space by 3
    st = fract(st); // Wrap around 1.0

    // Now we have 9 spaces that go from 0-1

    color = vec3(st,0.0);
    //color = vec3(circle(st,0.5));

	COLOR = vec4(color,1.0);
}
