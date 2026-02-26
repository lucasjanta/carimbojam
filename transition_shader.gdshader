shader_type canvas_item;

uniform float progress : hint_range(0.0, 1.0) = 0.0;
uniform int direction = 1; // 1 = esquerda->direita, -1 = direita->esquerda
uniform vec4 color : source_color = vec4(0.0, 0.0, 0.0, 1.0);

void fragment() {
    float wipe = progress;

    if (direction == -1) {
        wipe = 1.0 - progress;
    }

    if (UV.x < wipe) {
        COLOR = color;
    } else {
        discard;
    }
}