attribute vec4 position;
attribute vec2 TexCoordIn;
varying   vec2 TexCoordOut;

void main(void)
{
    gl_Position = position;
    TexCoordOut = TexCoordIn;
}
