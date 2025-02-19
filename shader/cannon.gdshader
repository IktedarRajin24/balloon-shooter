shader_type canvas_item;
uniform float scroll_speed = 1.0;

void fragment() {
    vec2 moving_uv = vec2(mod(UV.x - TIME * scroll_speed, 1.0), UV.y);
    vec4 in_tex = texture(TEXTURE, moving_uv);
    
    // Opacity gradient: fades out on the right side (UV.x closer to 1)
    float alpha_factor = smoothstep(1, 0.5, UV.x); // Adjust 0.8 to control fade start

    COLOR = vec4(in_tex.rgb, in_tex.a * (1.0 - alpha_factor)); // Invert fade effect
}
