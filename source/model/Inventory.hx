package model;

import entity.Item;
import entity.Items;
import util.Etc.*;

class Inventory
{
	private var data:Array<Item> = null;

	public function new(content = null)
	{
		if (content == null)
		{
			this.data = new Array<Item>();
		}
		else
		{
			this.data = content;
		}
	}

	public function sorted_itemID():Map<Int, Array<Item>>
	{
		var by_id = new Map();

		for (item in this.data)
		{
			if (!by_id.exists(item.itemId))
			{
				by_id[item.itemId] = new Array<Item>();
			}

			by_id[item.itemId].push(item);
		}
		return by_id;
	}

	public function num_items()
	{
		return this.data.length;
	}

	public function add(item:Item)
	{
		this.data.push(item);
	}

	public function pop()
	{
		return this.data.pop();
	}

	public function last_item()
	{
		return this.data[this.data.length - 1];
	}

	public function pretty_print():String
	{
		var ret = "" + this.num_items() + " items in total\n";

		var by_itemid = this.sorted_itemID();
		for (key in by_itemid.keys())
		{
			var value = by_itemid[key];
			var count = value.length;
			var item = Items.by_id(key);

			ret += "" + count + " of " + item.name + "\n";
		}

		return ret;
	}
}
