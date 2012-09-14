package guise.platform.types;

import guise.platform.IPlatformAccess;
import guise.geom.Matrix;

/**
 * @author Tom Byrne
 */

class DrawingAccessTypes 
{}

// TODO: Split this down into more logical chunks
interface IGraphics implements IAccessType
{
	
	function beginFill(color:Int, alpha:Float = 1.0):Void;
	function beginGradientFill(type:GradientType, gp:Array<{fract:Float, c:Int, a:Null<Float>}>, ?matrix:Matrix, ?spreadMethod:Null<SpreadMethod>, ?interpolationMethod:Null<InterpolationMethod>):Void;
	function clear():Void;
	function curveTo(inCX:Float, inCY:Float, inX:Float, inY:Float):Void;
	function drawEllipse(inX:Float, inY:Float, inWidth:Float, inHeight:Float):Void;
	function drawRect(inX:Float, inY:Float, inWidth:Float, inHeight:Float):Void;
	function drawRoundRect(x:Float, y:Float, w:Float, h:Float, r:Float):Void;
	function endFill():Void;
	function beginGradientStroke(type:GradientType, gp:Array<{fract:Float, c:Int, a:Null<Float>}>, ?matrix:Matrix, ?spreadMethod:Null<SpreadMethod>, ?interpolationMethod:Null<InterpolationMethod>):Void;
	function beginStroke(color:Int = 0, alpha:Float = 1.0):Void;
	function lineStyle(?thickness:Null<Float>, pixelHinting:Bool = false, ?caps:CapsStyle, ?joints:JointStyle):Void;
	function lineTo(inX:Float, inY:Float):Void;
	function moveTo(inX:Float, inY:Float):Void;
	
}
#if nme
import nme.display.BitmapData;
#end
interface IBitmapGraphics implements IGraphics
{

	function beginBitmapFill(bitmap:BitmapData, matrix:Matrix = null, repeat:Bool = true, smooth:Bool = false):Void;
	function beginBitmapStroke(bitmap:BitmapData, matrix:Matrix = null, repeat:Bool = true, smooth:Bool = false):Void;
	
}
enum GradientType {
	Linear;
	Radial(?focalPointRatio:Float);
}
enum SpreadMethod {
	Pad;
	Reflect;
	Repeat;
}
enum InterpolationMethod {
	LinearRgb;
	Rgb;
}
enum JointStyle{
	JoMiter(limit:Float);
	JoRound;
	JoBevel;
}
enum CapsStyle {
	CsNone;
	CsRound;
	CsSquare;
}