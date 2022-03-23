--The pets

minetest.register_node("pets:dog", {
	description = "Dog",
	tiles = {"dog_top_texture.png", "dog_bottom_texture.png", "dog_side_texture.png",
		"dog_side_texture.png", "dog_back_texture.png", "dog_front_texture.png"},
	groups = {oddly_breakable_by_hand = 3},
	is_ground_content = true,
})

minetest.register_node("pets:hungry_dog", {
	description = "Dog",
	tiles = {"dog_top_texture.png", "dog_bottom_texture.png", "dog_side_texture.png",
		"dog_side_texture.png", "dog_back_texture.png", "hungry_dog_front_texture.png"},
	groups = {oddly_breakable_by_hand = 3},
	is_ground_content = true,
})

minetest.register_node("pets:cat", {
	description = "Cat",
	tiles = {"dog_top_texture.png", "dog_bottom_texture.png", "dog_side_texture.png",
		"dog_side_texture.png", "cat_back_texture.png", "cat_front_texture.png"},
	groups = {oddly_breakable_by_hand = 3},
	is_ground_content = true,
})

minetest.register_node("pets:hungry_cat", {
	description = "Cat",
	tiles = {"dog_top_texture.png", "dog_bottom_texture.png", "dog_side_texture.png",
		"dog_side_texture.png", "cat_back_texture.png", "hungry_cat_front_texture.png"},
	groups = {oddly_breakable_by_hand = 3},
	is_ground_content = true,
})

--The papers

minetest.register_craftitem("pets:dog_paper", {
    description = "Dog Paper",
    inventory_image = "dog_paper_texture.png",
})

minetest.register_craftitem("pets:cat_paper", {
    description = "Cat Paper",
    inventory_image = "cat_paper_texture.png",
})

minetest.register_craft({
    output = "pets:dog_paper",
    recipe = {
        {"bones:bones"},
        {"default:paper"}
    }
})

minetest.register_craft({
    output = "pets:dog",
    recipe = {
        {"pets:dog_paper"}
    }
})

minetest.register_craft({
    output = "pets:cat_paper",
    recipe = {
        {"wool:white"},
        {"default:paper"}
    }
})

minetest.register_craft({
    output = "pets:cat",
    recipe = {
        {"pets:cat_paper"}
    }
})

--The food

minetest.register_craftitem("pets:fish", {
    description = "Fish",
    on_use = minetest.item_eat(1),
    inventory_image = "fish_texture.png",
})

minetest.register_craftitem("pets:cooked_fish", {
    description = "Cooked Fish",
    on_use = minetest.item_eat(5),
    inventory_image = "cooked_fish_texture.png",
})

minetest.register_craftitem("pets:dog_food", {
    description = "Dog Food",
    inventory_image = "dog_food_texture.png",
})

minetest.register_craftitem("pets:raw_vegan_meat", {
    description = "Raw Vegan Meat",
    on_use = minetest.item_eat(1),
    inventory_image = "raw_vegan_meat_texture.png",
})

minetest.register_craftitem("pets:cooked_vegan_meat", {
    description = "Cooked Vegan Meat",
    on_use = minetest.item_eat(5),
    inventory_image = "cooked_vegan_meat_texture.png",
})

--Cooking

minetest.register_craft({
	type = "cooking",
	output = "pets:cooked_vegan_meat",
	recipe = "pets:raw_vegan_meat",
})

minetest.register_craft({
    output = "pets:dog_food",
    recipe = {
        {"pets:cooked_vegan_meat"},
        {"default:paper"}
    }
})

--Feeding

minetest.register_craft({
    output = "pets:dog",
    recipe = {
        {"pets:dog_food"},
        {"pets:hungry_dog"}
    }
})

minetest.register_craft({
    output = "pets:cat",
    recipe = {
        {"pets:fish"},
        {"pets:hungry_cat"}
    }
})

--Make dog hungry

minetest.register_abm({
	label = "Make dog hungry 1",
	nodenames = {"pets:dog"},
	interval = 60,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.find_node_near(pos, 1, { "air" }) then
			minetest.set_node(pos, {name = "pets:hungry_dog"})
		end
	end
})

minetest.register_abm({
	label = "Make dog hungry 2",
	nodenames = {"pets:dog"},
	interval = 60,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.find_node_near(pos, 1, { "air" }) == nil then
			minetest.set_node(pos, {name = "pets:hungry_dog"})
		end
	end
})

--Make cat hungry

minetest.register_abm({
	label = "Make cat hungry 1",
	nodenames = {"pets:cat"},
	interval = 60,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.find_node_near(pos, 1, { "air" }) then
			minetest.set_node(pos, {name = "pets:hungry_cat"})
		end
	end
})

minetest.register_abm({
	label = "Make cat hungry 2",
	nodenames = {"pets:cat"},
	interval = 60,
	chance = 3,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.find_node_near(pos, 1, { "air" }) == nil then
			minetest.set_node(pos, {name = "pets:hungry_cat"})
		end
	end
})