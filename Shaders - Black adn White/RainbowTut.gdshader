shader_type canvas_item;

uniform float time : hint_range(0.0, 10, 0.01);


void fragment() {
	vec3 color = vec3(0.0);
	color.r = abs(sin((UV.y + TIME) * 3.0));
	color.g = abs(sin((UV.y + TIME + 0.33) * 0.7));
	color.b = abs(sin((UV.x + TIME + 0.67) * 3.0));
	COLOR.rgb *= color;
}
