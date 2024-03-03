shader_type canvas_item;

uniform float blink_speed = 1.0;
uniform bool blink_toggle = false;

uniform vec4 color1: source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform vec4 color2: source_color = vec4(0.0, 0.0, 1.0, 1.0);
uniform float amplitude = 0.5;
uniform float frequency = 2.0;
uniform bool pulsate_toggle = false;

void fragment() {
	vec4 color = texture(TEXTURE, UV);
	
	if(pulsate_toggle){
	float pulsate = sin(TIME * frequency) * amplitude;
	vec4 interpolatedColor = mix(color1, color2, pulsate);
	color.rgb += interpolatedColor.rgb;
	}

	if (blink_toggle){
	float blink = sin(TIME * blink_speed);
	
	color.a *= abs(blink);
	}
	
	COLOR = color;
}
