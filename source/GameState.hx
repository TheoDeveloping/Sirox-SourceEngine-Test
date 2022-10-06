package;

import flixel.FlxState;
import flixel.util.FlxColor;

class GameState extends FlxState {
	public var battle:HornyScript;
	public var system:HornyScript;
        public var map:Map<String, FlxColor> = [];
	
	override public function create() {
		super.create();
                var a:FlxColor;
                map.set('FlxColor', Type.getClass(a));
		battle = new HornyScript("game/battle.hx");
		battle.setVariable("this", this);
		battle.executeFunc("create", []);
		system = new HornyScript("game/system.hx");
		system.setVariable("this", this);
		system.executeFunc("create", []);
	}
	
	override public function update(elapsed:Float) {
		super.update(elapsed);
		battle.executeFunc("update", [elapsed]);
		system.executeFunc("update", [elapsed]);
	}
}
