shader_type canvas_item;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec3 draw_color : source_color = vec3(1.0);
uniform bool alpha;
uniform float rotation_angle : hint_range(0.0, 6.28319); // Góc xoay (tính bằng radian)

float box(in vec2 _st, in vec2 _size){
    _size = vec2(0.5) - _size*0.5;
    vec2 uv = smoothstep(_size,
                        _size+vec2(0.001),
                        _st);
    uv *= smoothstep(_size,
                    _size+vec2(0.001),
                    vec2(1.0)-_st);
    return uv.x*uv.y;
}

float add_cross(in vec2 _st, float _size){
    return  box(_st, vec2(_size,_size/4.)) +
            box(_st, vec2(_size/4.,_size));
}

void fragment(){
    vec2 st = UV;
    vec3 color = vec3(0.0);

    // To move the cross we move the space
    vec2 translate = vec2(cos(u_time),sin(u_time));
    st += translate*0.35;

    // Show the coordinates of the space on the background
     color = vec3(st.x,st.y,0.0);

    // Add the shape on the foreground
    color += vec3(add_cross(st,0.25));

    COLOR = vec4(color,1.0);
}
