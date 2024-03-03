shader_type spatial;

void vertex() {
    // Transform the vertex position
    VERTEX = mul(MODEL_MATRIX, VERTEX);
}

void fragment() {
    // Generate a random noise value based on fragment coordinates
    float noise = (fract(FRAGCOORD.x * 0.01) + fract(FRAGCOORD.y * 0.01)) * 0.5;

    // Set the base color for the painted look
    vec3 paint_color = vec3(0.8, 0.6, 0.4);

    // Apply the noise to create variation
    paint_color *= noise;

    // Assign the final color to the fragment
    COLOR.rgb = paint_color;
    COLOR.a = 1.0; // Set alpha to 1 to avoid transparency issues
}
