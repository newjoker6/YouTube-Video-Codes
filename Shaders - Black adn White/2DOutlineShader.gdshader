shader_type canvas_item;

uniform vec3 outline_color : source_color = vec3(1.0, 1.0, 1.0);
uniform float outline_size : hint_range(0.0, 1.0) = 1.0;

void fragment() {
    vec4 sprite_color = texture(TEXTURE, UV);
    vec4 outline = vec4(outline_color, sprite_color.a);
    float alpha_threshold = step(1.0 - outline_size, sprite_color.a) - step(1.0, sprite_color.a);
    vec4 final_color = mix(sprite_color, outline, alpha_threshold);
    COLOR = final_color;
}
