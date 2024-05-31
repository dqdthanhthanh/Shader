shader_type canvas_item;

uniform float u_time;
uniform vec2 u_resolution;

void fragment(){
    vec2 st = UV;
    vec3 color = vec3(0.0);

    // bottom-left
    vec2 bl = step(vec2(0.1),st);
    float pct = bl.x * bl.y;

    // top-right
    vec2 tr = step(vec2(0.1),1.0-st);
    pct *= tr.x * tr.y;

    color = vec3(pct);

    COLOR = vec4(color,1.0);
}
