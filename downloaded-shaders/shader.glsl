extern vec3 iResolution;


/**
 * @author jonobr1 / http://jonobr1.com/
 */

/**
 * Convert r, g, b to normalized vec3
 */
vec3 rgb(number r, number g, number b) {
	return vec3(r / 255.0, g / 255.0, b / 255.0);
}

/**
 * Draw a circle at vec2 `pos` with radius `rad` and
 * color `color`.
 */
vec4 circle(vec2 uv, vec2 pos, number rad, vec3 color) {
	number d = length(pos - uv) - rad;
	number t = clamp(d, 0.0, 1.0);
	return vec4(color, 1.0 - t);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord ) {

	vec2 uv = fragCoord.xy;
	vec2 center = iResolution.xy * 0.5;
	number radius = 0.25 * iResolution.y;

    // Background layer
	vec4 layer1 = vec4(rgb(210.0, 222.0, 228.0), 1.0);

	// Circle
	vec3 red = rgb(225.0, 95.0, 60.0);
	vec4 layer2 = circle(uv, center, radius, red);

	// Blend the two
	fragColor = mix(layer1, layer2, layer2.a);

}


vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords){
    vec2 fragCoord = texture_coords * iResolution.xy;
    mainImage( color, fragCoord );
    return color;
}
