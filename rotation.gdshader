shader_type canvas_item;

uniform float rotation_angle : hint_range(0.0, 6.28319); // Góc xoay (tính bằng radian)

void fragment() {
	//vec2 uv = FRAGCOORD.xy / SCREEN_PIXEL_SIZE.xy;
    vec2 uv = UV; // Tọa độ UV

    // Chuyển đổi tọa độ UV về tâm
    uv -= vec2(0.5);

    // Tính toán ma trận xoay thủ công
    float cos_angle = cos(rotation_angle);
    float sin_angle = sin(rotation_angle);

    // Xoay tọa độ UV bằng cách nhân với ma trận xoay
    vec2 rotated_uv;
    rotated_uv.x = uv.x * cos_angle - uv.y * sin_angle;
    rotated_uv.y = uv.x * sin_angle + uv.y * cos_angle;

    // Chuyển đổi tọa độ UV trở lại
    rotated_uv += vec2(0.5);

    // Lấy mẫu màu từ texture tại tọa độ UV đã biến đổi
    vec4 color = texture(TEXTURE, rotated_uv);

    // Gán màu cho fragment
    COLOR = color;
}
