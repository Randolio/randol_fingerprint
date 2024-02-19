## Randolio: Fingerprint (Rewritten) - 19/02/2024

An easy way for police to scan a player's fingerprint if they don't have any way of identifying themselves. (traffic stop etc..)

Preview: (https://i.imgur.com/InNRQuq.png)

## Requirements

* [ox_lib](https://github.com/overextended/ox_lib/releases/tag/v3.16.2)

## Item:

Add this item to your qb-core > shared > items.lua.

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

In order for police to get this item, just add it to the police armory list or make your own way of them obtaining it.

## [image]

This folder has the image for the item. Drag and drop the png into your inventory image folder.
