# randol_fingerprint

An easy way for police to scan a player's fingerprint if they don't have any way of identifying themselves. (traffic stop etc..)

Use's progressbar and qb-menu.


# Item:

Add this item to your qb-core > shared > items.lua.

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

In order for police to get this item, just add it to the police armory list or make your own way of them obtaining it.

# [image]

This folder has the image for the item. Drag and drop the png into qb-inventory > html > images (or whatever inventory you are using)

