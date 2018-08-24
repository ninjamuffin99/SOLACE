package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		var _player:Player = new Player(20, 20);
		add(_player);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
