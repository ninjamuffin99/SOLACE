package;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author 
 */
class Character extends FlxSprite 
{

	public var followSpeed:Int = 150;
	public var Speed:Float = 1900;
	private var Drag:Float = 700;
	private var MaxVel:Float = 100;

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		makeGraphic(32, 32, FlxColor.GREEN);
		
		drag.x = Drag;
		drag.y = Drag;
		maxVelocity.x = maxVelocity.y = MaxVel;
		
		resizeHitbox();
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);

		this.set_visible(this.isOnScreen());
	}
	
	private function resizeHitbox():Void
	{
		var hitWCut:Int = Std.int(width * 0.2);
		offset.set(hitWCut, height - height / 2);
		width = width - (hitWCut * 2);
		height = height / 2;
	}
}