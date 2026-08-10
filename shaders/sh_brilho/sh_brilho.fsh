varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_brilho;

void main()
{
    vec4 tex = texture2D(gm_BaseTexture, v_vTexcoord);

    vec3 cor = mix(tex.rgb, vec3(1.0,1.0,1.0), u_brilho);

    gl_FragColor = vec4(cor, tex.a) * v_vColour;
}