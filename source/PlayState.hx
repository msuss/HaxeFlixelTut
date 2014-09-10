package;

import flixel.FlxG;
import flixel.FlxCamera;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledObject;
import flixel.group.FlxTypedGroup;
import flixel.tile.FlxTilemap;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _player:Player;
	private var _map:TiledLevel;
	private var _mWalls:FlxTilemap;
	private var _grpCoins:FlxTypedGroup<Coin>;
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_map = new TiledLevel("assets/data/map.tmx");
		add(_map.foregroundTiles);
		add(_map.backgroundTiles);
		_map.loadObjects(this);
		_grpCoins = _map.getCoins();
		add(_grpCoins);
		_player = _map.getPlayer();
		add(_player);
		FlxG.camera.follow(_player, FlxCamera.STYLE_TOPDOWN, 1);
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		FlxG.overlap(_grpCoins, _player, getCoin);
		_map.collideWithLevel(_player);
		super.update();
	}	

	public function getCoin(coin:Coin, Player:FlxObject):Void
	{
		coin.kill();
	}
}