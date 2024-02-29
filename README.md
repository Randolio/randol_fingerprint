## Randolio: Fingerprint (Rewritten) - 29/02/2024

An easy way for police to scan a player's fingerprint if they don't have any way of identifying themselves. (traffic stop etc..)

This now utilizes job type 'leo'. Make sure your police jobs have this type in the jobs.lua.

Preview: (https://i.imgur.com/InNRQuq.png)

## Requirements

* [ox_lib](https://github.com/overextended/ox_lib/releases/)

## Item:

if qb-inventory, Add this item to your qb-core > shared > items.lua.

```
["policetablet"] = {
	["name"] = "policetablet",
	["label"] = "Police Tablet",
	["weight"] = 5000,
	["type"] = "item",
	["image"] = "policetablet.png",
	["unique"] = true,
	['useable'] = true,
	["shouldClose"] = true,
	["combinable"] = nil,
	["description"] = "A mobile fingerprint tablet."
},
```

if ox_inventory, add this to ox inventory items.lua

```
["policetablet"] = {
	label = "Police Tablet",
	weight = 5000,
	stack = false,
	close = true,
	description = "A mobile fingerprint tablet.",
	client = {
		image = "policetablet.png",
	}
},
```

In order for police to get this item, just add it to the police armory list or make your own way of them obtaining it.

## [image]

This folder has the image for the item. Drag and drop the png into your inventory image folder.
