package guise.skin.bitmap.utils;

import msignal.Signal;


@:build(LazyInst.check())
class TexturePack 
{
	@lazyInst
	public var changed:Signal1<TexturePack>;
	
	#if starling
	public var pack:starling.textures.TextureAtlas;
	#elseif tilelayer
	public var pack:aze.display.TilesheetEx;
	#end
	
	
	private var _imagePath:String;
	private var _dataPath:String;
	private var _contextReady:Bool;

	public function new(?imagePath:String, dataPath:String) 
	{
		if (imagePath != null && dataPath != null) {
			setTexture(imagePath, dataPath);
		}
	}
	
	public function setTexture(imagePath:String, dataPath:String):Void {
		_imagePath = imagePath;
		_dataPath = dataPath;
		checkTexture();
	}
	
	public function contextReady():Void {
		_contextReady = true;
		checkTexture();
	}
	
	public function checkTexture():Void {
		if (_imagePath == null || _dataPath == null || !_contextReady) return;
		
		#if starling
		var bitmap = nme.Assets.getBitmapData(_imagePath);
		var xml = new flash.xml.XML(nme.Assets.getText(_dataPath));
		pack = new starling.textures.TextureAtlas(starling.textures.Texture.fromBitmapData(bitmap), xml);
		
		#elseif tilelayer
		pack = new aze.display.SparrowTilesheet(nme.Assets.getBitmapData(_imagePath), nme.Assets.getText(_dataPath));
		
		#end
		
		LazyInst.exec(changed.dispatch(this));
	}
}