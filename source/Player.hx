package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author 
 */
class Player extends Character 
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		
		controls();
	}
	
	private function controls():Void
	{
		var _left:Bool = FlxG.keys.anyPressed(["A"]);
		var _right:Bool = FlxG.keys.anyPressed(["D"]);
		var _down:Bool = FlxG.keys.anyPressed(["S"]);
		var _up:Bool = FlxG.keys.anyPressed(["W"]);
		
		if (_left && _right)
		{
			_left = _right = false;
		}
		
		if (_up && _down)
		{
			_up = _down = false;
		}
		
		if (_left || _right || _up || _down)
		{
			if (FlxG.keys.pressed.SHIFT)
			{
				maxVelocity.set(MaxVel * 1.4, MaxVel * 1.4);
			}
			else
			{
				maxVelocity.set(MaxVel, MaxVel);
			}
			
			if (_up)
			{
				acceleration.y = -Speed;
				facing = FlxObject.UP;
			}
			else if (_down)
			{
				acceleration.y = Speed;
				facing = FlxObject.DOWN;
			}
			else
				acceleration.y = 0;
			
			if (_left)
			{
				facing = FlxObject.LEFT;
				acceleration.x = -Speed;
			}
			else if (_right)
			{
				facing = FlxObject.RIGHT;
				acceleration.x = Speed;
			}
			else
				acceleration.x = 0;
			
			//acceleration.set(_playerSpeed, 0);
			//acceleration.rotate(FlxPoint.weak(0, 0), mA);
		}
		else
		{
			acceleration.x = acceleration.y = 0;
		}
	}
	
}