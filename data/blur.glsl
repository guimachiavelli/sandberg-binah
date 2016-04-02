#version 410
uniform sampler2D texture;
uniform vec2 texOffset;

in vec2 vertTexCoord;
out vec4 fragColor;

void main() {
    fragColor += texture(texture, vertTexCoord - 1.5 * texOffset);
    fragColor += texture(texture, vertTexCoord - 1.5 * vec2(texOffset.x, -texOffset.y));
    fragColor += texture(texture, vertTexCoord + 1.5 * vec2(texOffset.x, -texOffset.y));
    fragColor += texture(texture, vertTexCoord + 1.5 * texOffset);
    fragColor *= 0.25;
}
