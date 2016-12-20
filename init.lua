-- Fluorescent blocks

minetest.register_node("fluorescence:fluorescent_water_source", {
	description = "Fluorescent Water Source",
	drawtype = "liquid",
	tiles = {
		{
			name = "fluorescence_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	special_tiles = {
		-- New-style water source material (mostly unused)
		{
			name = "fluorescence_water_source_animated.png",
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
			backface_culling = false,
		},
	},
	light_source = 10,	
alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "fluorescence:fluorescent_water_flowing",
	liquid_alternative_source = "fluorescence:fluorescent_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1},
})

minetest.register_node("fluorescence:fluorescent_water_flowing", {
	description = "Fluorescent Water",
	drawtype = "flowingliquid",
	tiles = {"fluorescence_water_flowing_animated.png"},
	special_tiles = {
		{
			name = "fluorescence_water_flowing_animated.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
		{
			name = "fluorescence_water_flowing_animated.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 0.8,
			},
		},
	},
	light_source = 10,	
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "fluorescence:fluorescent_water_flowing",
	liquid_alternative_source = "fluorescence:fluorescent_water_source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1},
})


minetest.register_node("fluorescence:fluorescent_dirt", {
	description = "Fluorescent Dirt",
	tiles = {"fluorescence_dirt.png"},
	groups = {crumbly = 3, soil = 1},	
	light_source = 10,
	sounds = default.node_sound_dirt_defaults(),	

})

minetest.register_node("fluorescence:fluorescent_dirt_with_grass", {
	description = "Fluorescent Dirt with Grass",
	tiles = {"fluorescence_grass.png", "fluorescence_dirt.png",
		{name = "fluorescence_dirt.png^fluorescence_grass_side.png",
			tileable_vertical = false}},
	groups = {crumbly = 3, soil = 1},
	drop = 'default:dirt',
		light_source = 10,
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "default_grass_footstep", gain = 0.25},
	}),
})

minetest.register_node("fluorescence:fluorescent_leaves", {
	description = "Fluorescent Leaves",
	drawtype = "allfaces_optional",
	waving = 1,
	visual_scale = 1.3,
	tiles = {"fluorescence_leaves.png"},
	special_tiles = {"fluorescence_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy = 3, leafdecay = 3, flammable = 2, leaves = 1},
	sounds = default.node_sound_leaves_defaults(),	
	light_source = 10,
	drop = {
		max_items = 1,
		items = {
			{
				-- player will get leaves only if he get no saplings,
				-- this is because max_items is 1
				items = {'default:leaves'},
			}
		}
	},
})

minetest.register_node("fluorescence:fluorescent_tree", {
	description = "Fluorescent Tree",
	tiles = {"fluorescence_tree_top.png", "fluorescence_tree_top.png",
		"fluorescence_tree.png"},
	paramtype2 = "facedir",
	light_source = 10,
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})
