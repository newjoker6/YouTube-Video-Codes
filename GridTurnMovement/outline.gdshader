shader_type spatial;
render_mode unshaded, cull_front;

uniform bool enable_outline = true;
uniform float outline_thickness : hint_range(0.0, 0.1) = 0.01;
uniform vec4 outline_color : source_color = vec4(0.0, 1.0, 0.0, 1.0);

void vertex() {
	if (enable_outline) {
		VERTEX += normalize(VERTEX) * outline_thickness;
	}
}

void fragment() {
	if (enable_outline) {
		ALBEDO = outline_color.rgb;
	}
}
