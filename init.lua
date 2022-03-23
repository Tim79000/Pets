minetest.register_node("pets:dog", {
	description = "Dog",
	tiles = {"dog_top_texture.png", "dog_bottom_texture.png", "dog_side_texture.png",
		"dog_side_texture.png", "dog_back_texture.png", "dog_front_texture.png"},
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





