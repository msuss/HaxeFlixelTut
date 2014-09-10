
package ;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Coin extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/images/coin.png", false, 8, 8);
	}
	
	override public function kill():Void 
	{
		alive = false;
		FlxTween.tween(this, { alpha:0, y:y - 16 }, .66, { type:FlxTween.ONESHOT, ease:FlxEase.circOut, complete:finishKill } );
	}
	
	private function finishKill(T:FlxTween):Void
	{
		exists = false;
	}
}