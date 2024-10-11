function Inventory()constructor {
	_inventory_items = [];
	// an array of items in our inventory
	
	// seting name, quantity and sprite of an item
	item_set = function (_name, _quantity, _sprite)
	{
		// pushes items to the end of an array
		array_push(_inventory_items, 
		{
			name: _name,
			quantity: _quantity,
			sprite: _sprite
		});
		
	}
	// look for item. Loop through array, compare names. 
	item_find = function(_name)
	{
		for (var i = 0; i < array_length(_inventory_items); i++) 
		{
			if (_name ==_inventory_items[i].name)
			{
				return i;
			}
		}
		return -1;
	}
	
	// add item to inventory - if item is found, add to quantity. If not, set item.
	item_add = function (_name, _quantity, _sprite)
	{
		var _index = item_find(_name);
		
		if (_index >= 0)
		{
			_inventory_items[_index].quantity += _quantity;
		} else {
			item_set(_name, _quantity, _sprite);
		}
	}
	
	item_has = function(_name, _quantity)
	{
		var index = item_find(_name)
		
		if (index >= 0) 
		{
			return _inventory_items[index].quantity >= _quantity
		}
		return false
	}
	
	item_subtract = function(_name, _quantity)
	{
		var index = item_find(_name)
	
		if (index >= 0) 
		{
			item_has(_name, _quantity)
			{
			_inventory_items[index].quantity -= _quantity
			
				if (_inventory_items[index].quantity <= 0)
				{
				item_remove(index)
				}
			}
		}
	}
	
	item_remove = function(index)
	{
		array_delete(_inventory_items, index, 1)
	}
	
	item_get = function()
	{
		return _inventory_items
	}
	// what the fuck is this
	toString = function() 
	{
		return json_stringify(_inventory_items)
	}
}

