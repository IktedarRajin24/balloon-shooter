shader_type canvas_item;

uniform float time : hint_range(0.0, 10.0); // Uniform to control time-based animation

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// Called for every pixel the material is visible on.
    float dot_spacing = 0.7; // Smaller values = more dots
    float dot_radius = 0.2;  // Larger values = bigger dots
    
    // Modify the UV.x to make the dots move horizontally over time
    float animated_x = UV.x + sin(time + UV.y * 10.0) * 0.1; // Sinusoidal movement
    float nearest_dot = floor(animated_x / dot_spacing + 0.5) * dot_spacing;
    
    vec2 center = vec2(nearest_dot, 0.5);
    float dist = length(UV - center);
    
    // Create smooth dots
    float alpha = 1.0 - smoothstep(dot_radius - 0.001, dot_radius + 0.001, dist);
    COLOR = vec4(0.0, 0.0, 0.0, alpha);
}