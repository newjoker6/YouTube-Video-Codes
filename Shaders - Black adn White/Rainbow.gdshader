shader_type canvas_item;

uniform float time : hint_range(0, 10, 0.01);

void fragment() {
    // Calculate the color based on time and UV coordinates
    vec3 color = vec3(0.0);
    color.r = abs(sin((SCREEN_UV.x + TIME) * 0.7));
    color.g = abs(sin((SCREEN_UV.x + TIME + 0.33) * 0.7));
    color.b = abs(sin((SCREEN_UV.x + TIME + 0.67) * 0.7));
    COLOR.rgb *= color;

}
