package guiseSkins.styled.styles;
import composure.core.ComposeItem;
import composure.utilTraits.Furnisher;
import guise.controls.ControlLayers;
import guise.traits.tags.ControlTags;
import guise.layer.LayerOrderer;

/**
 * ...
 * @author Tom Byrne
 */

class NormalLayering 
{

	public static function install(within:ComposeItem) 
	{
		var furnisher:Furnisher = new Furnisher(TextButtonTag);
		furnisher.addTrait(TFact(function() { return new LayerOrderer([ControlLayers.BACKING, ControlLayers.LABEL_TEXT]);}) );
		within.addTrait(furnisher);
		
		furnisher = new Furnisher(TextInputTag);
		furnisher.addTrait(TFact(function() { return new LayerOrderer([ControlLayers.BACKING, ControlLayers.INPUT_TEXT]);} ));
		within.addTrait(furnisher);
	}
	
}