shader_type canvas_item;

uniform vec4 color : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform float direction : hint_range(-1.0, 1.0) = -1.0;
uniform float frequency : hint_range(0.1, 30.0) = 15.0;
uniform float speed : hint_range(0.5, 20.0) = 3.0;
uniform float dot_spacing : hint_range(0.1, 1.0) = 0.7;
uniform float dot_radius : hint_range(0.01, 0.5) = 0.2;

void fragment() {
    // Calculate grid-based dots
    float nearest_dot = floor(UV.x / dot_spacing + 0.5) * dot_spacing;
    vec2 center = vec2(nearest_dot, 0.5);
    float dist = length(UV - center);
    float alpha = 1.0 - smoothstep(dot_radius - 0.001, dot_radius + 0.001, dist);

    // Calculate polar coordinates
    vec2 pos = UV - vec2(0.5);
    float angle = atan(pos.y, pos.x);

    // Create rotating wave pattern
    float wave = 0.5 * sin(direction * frequency * angle + TIME * speed) + 0.5;
    float mask = step(0.5, wave);

    // Combine dot pattern with rotating mask
    COLOR = vec4(color.rgb, alpha * mask * color.a);
}