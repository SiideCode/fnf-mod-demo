package states;

import flixel.FlxSubState;
import flixel.effects.FlxFlicker;
import lime.app.Application;

class FlashingState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var texts:FlxTypedSpriteGroup<FlxText>;
	var bg:FlxSprite;

	override function create()
	{
		super.create();

		bg = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);

		texts = new FlxTypedSpriteGroup<FlxText>();
		texts.alpha = 0.0;
		add(texts);

		var warnText:FlxText = new FlxText(0, 0, FlxG.width, "!!!WARNING!!!\n
			This DEMO was made in a rush!\n
			ALL of the content is far from final!\n
			Press ENTER or ESCAPE to continue.");
		warnText.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		texts.add(warnText);

		FlxTween.tween(texts, {alpha: 1.0}, 0.5);
	}

	override function update(elapsed:Float)
	{
		if (leftState)
		{
			super.update(elapsed);
			return;
		}
		var back:Bool = controls.BACK;
		if (controls.ACCEPT || back)
		{
			leftState = true;
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			ClientPrefs.saveSettings();
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxFlicker.flicker(texts, 1, 0.1, false, true, function(flk:FlxFlicker)
			{
				new FlxTimer().start(0.5, function(tmr:FlxTimer)
				{
					FlxTween.tween(texts, {alpha: 0}, 0.2, {
						onComplete: (_) -> MusicBeatState.switchState(new TitleState())
					});
				});
			});
		}
		super.update(elapsed);
	}
}
