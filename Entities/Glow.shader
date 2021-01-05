shader_type canvas_item;
uniform sampler2D emission_sprite;
uniform vec4 glow_color : hint_color = vec4(1.0);

void fragment () 
{
	vec4 currentColor = texture(TEXTURE,UV);
	vec4 emission = texture(emission_sprite, UV);
	
	if (emission.r > 0f) {
		COLOR = (currentColor + glow_color);
	} else {
		COLOR = currentColor; //do nothing
	}
	   
}
