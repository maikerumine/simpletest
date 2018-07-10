
local S = mobs.intllib

-- name tag
minetest.register_craftitem("mobs:nametag", {
	description = S("Name Tag"),
	inventory_image = "mobs_nametag.png",
	groups = {flammable = 2},
})

if minetest.get_modpath("default") and minetest.get_modpath("default") then
	minetest.register_craft({
		type = "shapeless",
		output = "mobs:nametag",
		recipe = {"default:leaves", "default:coal_lump", "default:stick"},
	})
end

-- leather
minetest.register_craftitem("mobs:leather", {
	description = S("Leather"),
	inventory_image = "mobs_leather.png",
	groups = {flammable = 2},
})

-- raw meat
minetest.register_craftitem("mobs:meat_raw", {
	description = S("Raw Meat"),
	inventory_image = "mobs_meat_raw.png",
	on_use = minetest.item_eat(3),
	groups = {food_meat_raw = 1, flammable = 2},
})

-- cooked meat
minetest.register_craftitem("mobs:meat", {
	description = S("Meat"),
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
	groups = {food_meat = 1, flammable = 2},
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "mobs:meat_raw",
	cooktime = 5,
})

-- lasso
minetest.register_tool("mobs:lasso", {
	description = S("Lasso (right-click animal to put in inventory)"),
	inventory_image = "mobs_magic_lasso.png",
	groups = {flammable = 2},
})

if minetest.get_modpath("default") then
	minetest.register_craft({
		output = "mobs:lasso",
		recipe = {
			{"default:mese_crystal", "", "default:mese_crystal"},
			{"", "default:stick", ""},
			{"default:mese_crystal", "", "default:mese_crystal"},
		}
	})
end

minetest.register_alias("mobs:magic_lasso", "mobs:lasso")

-- net
minetest.register_tool("mobs:net", {
	description = S("Net (right-click animal to put in inventory)"),
	inventory_image = "mobs_net.png",
	groups = {flammable = 2},
})

if minetest.get_modpath("default") then
	minetest.register_craft({
		output = "mobs:net",
		recipe = {
			{"group:stick", "", "group:stick"},
			{"group:stick", "", "group:stick"},
			{"default:mese_crystal", "group:stick", "default:mese_crystal"},
		}
	})
end
--[[
-- shears (right click to shear animal)
minetest.register_tool("mobs:shears", {
	description = S("Steel Shears (right-click to shear)"),
	inventory_image = "mobs_shears.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	output = 'mobs:shears',
	recipe = {
		{'', 'default:mese_crystal', ''},
		{'', 'group:stick', 'default:mese_crystal'},
	}
})
]]
-- protection rune
minetest.register_craftitem("mobs:protector", {
	description = S("Mob Protection Rune"),
	inventory_image = "mobs_protector.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "mobs:protector",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "default:mese_crystal", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})

-- saddle
minetest.register_craftitem("mobs:saddle", {
	description = S("Saddle"),
	inventory_image = "mobs_saddle.png",
	groups = {flammable = 2},
})

minetest.register_craft({
	output = "mobs:saddle",
	recipe = {
		{"mobs:leather", "mobs:leather", "mobs:leather"},
		{"mobs:leather", "default:mese_crystal", "mobs:leather"},
		{"mobs:leather", "default:mese_crystal", "mobs:leather"},
	}
})

-- mob fence (looks like normal fence but collision is 2 high)
default.register_fence("mobs:fence_wood", {
	description = S("Mob Fence"),
	texture = "default_wood.png",
	material = "default:fence_wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 1.9, 0.5},
		},
	},
})

-- items that can be used as fuel
minetest.register_craft({
	type = "fuel",
	recipe = "mobs:nametag",
	burntime = 3,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mobs:lasso",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mobs:net",
	burntime = 8,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mobs:leather",
	burntime = 4,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mobs:saddle",
	burntime = 7,
})

minetest.register_craft({
	type = "fuel",
	recipe = "mobs:fence_wood",
	burntime = 7,
})
