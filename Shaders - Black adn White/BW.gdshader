shader_type canvas_item;

void fragment() {
	COLOR.rgb =vec3(dot(COLOR.rgb, vec3(0.299, 0.587, 0.114)));
}
