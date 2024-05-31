shader_type canvas_item;

uniform float u_time;
uniform vec2 u_resolution;


float plot(vec2 st) {    
    return smoothstep(0.02, 0.0, abs(st.y - st.x));
}

void fragment() {
	// Called for every pixel the material is visible on.
	// Basic
	//vec4 input_color = texture(TEXTURE,UV);
	//float color_average = (input_color.r + input_color.g + input_color.b)/3.0;
	//vec4 output_color = vec4(color_average,color_average,color_average,input_color.a);
	//float check_color = 0.7;
	//if (output_color.r > check_color && output_color.g > check_color && output_color.b > check_color){
		////output_color.a = 0.0;
		//output_color = vec4(1,1,1,1);
	//}
	//COLOR = output_color;
	
	// Time
	//COLOR = vec4(abs(sin(u_time)),0.0,0.0,1.0);
	
	// Resolution
	//vec2 st = FRAGCOORD.xy/u_resolution;
	//COLOR = vec4(st.x,st.y,0.0,1.0);
	
	// Draw line
	//vec2 st = FRAGCOORD.xy/u_resolution;
	//float y = st.x;
	//vec3 color = vec3(y);
	//// Plot a line
	//float pct = plot(st);
	//color = (1.0-pct)*color+pct*vec3(0.0,1.0,0.0);
	//COLOR = vec4(color,1.0);
	
	//vec2 st = FRAGCOORD.xy/u_resolution.xy;
	//vec2 st = vec2(UV.x, abs(UV.y-1.0));
	float t = u_time;
	vec2 r = u_resolution;
	vec3 c;
	float l,z=t;
	for(int i=0;i<3;i++) {
		//vec2 uv,p=FRAGCOORD.xy/r;
		vec2 uv,p=UV;
		uv=p;
		p-=.5;
		p.x*=r.x/r.y;
		z+=.07;
		l=length(p);
		uv+=p/l*(sin(z)+1.)*abs(sin(l*9.-z-z));
		c[i]=.01/length(mod(uv,1.)-.5);
	}
	COLOR=vec4(c/l,t);
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
