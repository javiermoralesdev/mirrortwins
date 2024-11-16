shader_type canvas_item;

void fragment(){
	float grayscale = (COLOR.r + COLOR.g + COLOR.b) / 3.0 * 1.0;
	float factor = 0.0;
	if(grayscale > 0.5){
		factor = 1.0;
	}

	//COLOR = vec4(factor, factor, factor, COLOR.a);
	COLOR = vec4(grayscale, grayscale, grayscale, COLOR.a);
}
