shader_type spatial;

render_mode depth_draw_always, cull_disabled, specular_schlick_ggx;

uniform float ramp = 2.0;
uniform sampler2D ripple : hint_normal;
uniform float rippleFactor = 0.5;
uniform float tilling = 20.0;
uniform float met = 1.0;
uniform float rough = 0.6;
uniform vec3 waterColour1 = vec3(0.0, 0.08, 0.04);
uniform vec3 waterColour2 = vec3(0.0, 0.02, 0.02);

uniform bool chromatic_aberration = false;
uniform float chromatic_aberration_level = 0.5;

uniform sampler2D Depth_Texture : hint_depth_texture, filter_linear_mipmap;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;


float linearizeDepth(in float depth) {
    float zNear = 0.1;
    float zFar = 500.0;
    return 2.0 * zFar * zNear / (zFar + zNear - (zFar - zNear) * (2.0 * depth - 1.0));
}

vec2 rotate(vec2 tex, float deg) {
    mat2 rotate;
    float s = sin(deg);
    float c = cos(deg);
    rotate[0][0] = c;
    rotate[1][0] = -s;
    rotate[0][1] = s;
    rotate[1][1] = c;
    return tex * rotate;
}

void fragment() {
    float t = TIME;
    float t20 = t / 20.0;
    vec3 nrm = mix(mix(texture(ripple, UV * tilling + t20).rgb,
                       texture(ripple, rotate(UV, 1.0) * tilling - t20).rgb, 0.5),
                       texture(ripple, 0.01 * UV * tilling).rgb, 0.5);
//-----------------------------------------------------------------------
	float superficie = linearizeDepth(FRAGCOORD.z);
    vec2 uv = (2.0 * nrm - 1.0).rg * rippleFactor * 0.05;
    float profundidad = linearizeDepth(texture(Depth_Texture, SCREEN_UV).r) - superficie;
    uv *= clamp(profundidad, 0.0, 1.0);
    float profundidad_distort = (linearizeDepth(texture(Depth_Texture, SCREEN_UV + uv).r) - superficie);
//-----------------------------------------------------------------------

    float azul;
    float verde;
    if (profundidad_distort >= 0.0) {
        azul = (2.0 * ramp - clamp(profundidad_distort, 0.0, 2.0 * ramp)) / (2.0 * ramp);
        verde = (1.0 * ramp - clamp(profundidad_distort, 0.0, 1.0 * ramp)) / ramp;
    } else {
        azul = (2.0 * ramp - clamp(profundidad, 0.0, 2.0 * ramp)) / (2.0 * ramp);
        verde = (1.0 * ramp - clamp(profundidad, 0.0, 1.0 * ramp)) / ramp;
    }
//-----------------------------------------------------------------------
    vec3 fondo;
    if (chromatic_aberration) {
        fondo.r = texture(SCREEN_TEXTURE, SCREEN_UV + uv * (1.0 + chromatic_aberration_level * nrm.xy * (1.0 - verde))).r;
        fondo.g = texture(SCREEN_TEXTURE, SCREEN_UV + uv).g;
        fondo.b = texture(SCREEN_TEXTURE, SCREEN_UV + uv * (1.0 - chromatic_aberration_level * nrm.xy * (1.0 - verde))).b;
    } else {
        fondo = texture(SCREEN_TEXTURE, SCREEN_UV + uv).rgb;
    }
//-----------------------------------------------------------------------
    ALBEDO = mix(waterColour2, mix(waterColour1, fondo, verde), azul);
    ROUGHNESS = rough;
    METALLIC = met;
    ANISOTROPY = clamp(rippleFactor, 0.0, 1.0);
    ANISOTROPY_FLOW = uv.xy;
    NORMAL = mix(vec3(0.5, 0.5, 0.5), normalize(nrm), clamp(rippleFactor * 0.1, 0.0, 1.0));
    if (profundidad <= 0.1 && profundidad >= 0.0)
        ALPHA = clamp(mix(profundidad, profundidad_distort, clamp(profundidad * 10.0, 0.0, 1.0)) * 10.0, 0.0, 1.0);
}







