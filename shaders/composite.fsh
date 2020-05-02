#version 120

uniform sampler2D gcolor;
uniform sampler2D gnormal;
uniform sampler2D gdepth;

varying vec2 texcoord;

const int RGBA16 = 1;
const int gcolorFormat = RGBA16;

void main() {
	vec3 finalComposite = texture2D(gcolor, texcoord).rgb;
	vec3 finalCompositeNormal = texture2D(gnormal, texcoord).rgb;
	vec3 finalCompositeDepth = texture2D(gdepth, texcoord).rgb;

/* DRAWBUFFERS:012 */
	gl_FragData[0] = vec4(finalComposite, 1.0); //gcolor
	gl_FragData[0] = vec4(finalCompositeNormal, 1.0); //gnormal
	gl_FragData[0] = vec4(finalCompositeDepth, 1.0); //gdepth
}