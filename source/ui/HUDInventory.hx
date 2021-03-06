package ui;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import model.Inventory;

using flixel.util.FlxSpriteUtil;

class HUDInventory extends FlxTypedGroup<FlxSprite>
{
	var background:FlxSprite;
	var inventoryText:FlxText;

	public function new()
	{
		super();
		background = new FlxSprite().makeGraphic(FlxG.width, 20, FlxColor.BLACK);
		background.drawRect(0, 19, FlxG.width, 1, FlxColor.WHITE);
		inventoryText = new FlxText(16, 2, 0, "le inv :DDDDDD", 8);
		inventoryText.setBorderStyle(SHADOW, FlxColor.GRAY, 1, 1);
		add(background);
		add(inventoryText);
		forEach(function(sprite) sprite.scrollFactor.set(0, 0));
	}

	public function updateHUD(inv:Inventory)
	{
		inventoryText.text = inv.pretty_print();
	}
}
