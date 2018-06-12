varying lowp vec2 var_texcoord0;
varying lowp vec4 var_face_color;
varying lowp vec4 var_outline_color;
varying lowp vec4 var_sdf_params;

uniform mediump sampler2D texture;
uniform lowp vec4 texture_size_recip;

uniform lowp vec4 blur;

void main()
{    
    lowp float edge = var_sdf_params.x;
    lowp float df_smoothing = var_sdf_params.z + var_sdf_params.z * blur.x;
    lowp vec2 dx = vec2(texture_size_recip.x * (blur.x / 3.1), 0.0);
    lowp vec2 dy = vec2(0.0, texture_size_recip.y * (blur.x / 3.1));
    
    float c = 0.0;
    for(float cx = -3.0; cx <= 3.0; cx++) {
        for(float cy = -3.0; cy <= 3.0; cy++) {
            lowp float d = texture2D(texture, var_texcoord0 + dx * cx + dy * cy).x;
            c = c + smoothstep(edge - df_smoothing, edge + df_smoothing, d);
        }
    }
    c = c / 49.0;
    lowp vec4 color = var_face_color * vec4(c, c, c, 0.0);
    gl_FragColor = color;
}
