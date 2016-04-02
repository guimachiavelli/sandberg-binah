#version 410
uniform mat4 transform;

in vec4 vertex;
in vec2 texCoord;

out vec2 vertTexCoord;

void main() {
    vertTexCoord = vec2(texCoord.x, 1.0 - texCoord.y);
    gl_Position = transform * vertex;
}
