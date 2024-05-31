shader_type canvas_item;

uniform float u_time;
uniform vec2 u_resolution;
uniform vec3 draw_color : source_color = vec3(1.0);
uniform bool alpha;
uniform float rotation_angle : hint_range(0.0, 6.28319); // Góc xoay (tính bằng radian)

#define PI 3.14159265359
#define TWO_PI 6.28318530718

void fragment(){
  vec2 st = UV;
  st.x *= u_resolution.x/u_resolution.y;
  vec3 color = vec3(0.0);
  float d = 0.0;

  // Remap the space to -1. to 1.
  st = st *2.-1.;

  // Number of sides of your shape
  int N = 3;

  // Angle and radius from the current pixel
  float a = atan(st.x,st.y)+PI;
  float r = TWO_PI/float(N);

  // Shaping function that modulate the distance
  d = cos(floor(.5+a/r)*r-a)*length(st);

  color = vec3(1.0-smoothstep(.4,.41,d));
  // color = vec3(d);

  COLOR = vec4(color,1.0);
}
