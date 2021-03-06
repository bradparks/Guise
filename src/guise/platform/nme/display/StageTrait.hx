package guise.platform.nme.display;
import guise.platform.nme.display.ContainerTrait;
import nme.display.Stage;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.events.Event;
import msignal.Signal;

class StageTrait extends ContainerTrait//, implements IWindowInfo
{
	private static var _inst:StageTrait;
	public static function inst():StageTrait {
		if (_inst == null) {
			_inst = new StageTrait();
		}
		return _inst;
	}
	
	/*@lazyInst
	public var availSizeChanged(default, null):Signal1<IWindowInfo>;
	
	public var availWidth(default, null):Int;
	public var availHeight(default, null):Int;*/
	
	public var stage(get_stage, null):Stage;
	private function get_stage():Stage {
		return _stage;
	}
	
	private var _stage:Stage;

	public function new() 
	{
		_stage = nme.Lib.stage;
		super(_stage);
		
		_stage.align = StageAlign.TOP_LEFT;
		_stage.scaleMode = StageScaleMode.NO_SCALE;
		
		setAvailSize(_stage.stageWidth, _stage.stageHeight);
		_stage.addEventListener(Event.RESIZE, onResize);
	}
	override private function assumeDisplayObject():Void {
		// ignore
	}
	
	private function onResize(e:Event):Void {
		setAvailSize(_stage.stageWidth, _stage.stageHeight);
	}
	
	private function setAvailSize(width:Int, height:Int):Void {
		/*if (this.availWidth != width || this.availHeight != height) {
			this.availWidth = width;
			this.availHeight = height;
			
			LazyInst.exec(availSizeChanged.dispatch(this));
		}*/
	}
}