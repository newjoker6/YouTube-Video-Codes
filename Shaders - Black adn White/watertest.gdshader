shader_type canvas_item;

uniform float time_scale : hint_range(0.0, 1.0) = 0.5;
uniform float wave_frequency : hint_range(0.0, 10.0) = 1.0;
uniform float wave_amplitude : hint_range(0.0, 1.0) = 0.1;
uniform float distortion_factor : hint_range(0.0, 1.0) = 0.2;
uniform float speed : hint_range(0.0, 1.0) = 0.5;

void fragment() {
    vec2 uv = UV;
    float waveTime = TIME * time_scale;
    float waveOffset = uv.x + waveTime * speed;
    vec2 distortion = vec2(
        0.0,
        sin(waveOffset * wave_frequency) * wave_amplitude
    ) * distortion_factor;

    COLOR = texture(TEXTURE, uv + distortion);
}
