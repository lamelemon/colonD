global.tile_size = 16;

global.masks = [
	{
		name: "Empty Mask",
		sprite: Sprite_blank,
		description: "Unequips your mask.", 
		charges: 0,
		enabled: true,
		passive_ability: true,
		ability: function() {
			
		}
	},
	{	
		name: "Smiley Mask", 
		sprite: Mask_smiley, 
		description: "Lets you push blocks.", 
		charges: 3,
		enabled: true,
		passive_ability: false,
		toggle_ability: true,
		ability: function() {
			with (obj_player) {
				var dir_x = 0;
				var dir_y = 0;
				if (abs(var_x_movement) > abs(var_y_movement)) dir_x = sign(var_x_movement) * obj_Movable_rock.sprite_width / 2;
				else dir_y = sign(var_y_movement) * obj_Movable_rock.sprite_width / 2;
				
				var rock = instance_place(x + dir_x, y + dir_y, obj_Movable_rock);

				if (instance_exists(rock) && !place_meeting(rock.x + dir_x, rock.y + dir_y, [layer_tilemap_get_id("Tile_Upper"), layer_tilemap_get_id("Tile_Walls")])) {
					rock.x += dir_x;
					rock.y += dir_y;
				}
			}
		}
	},
	{ 
		name: "Sad Mask",
		sprite: Mask_sad, 
		description: "Lets you pull blocks.", 
		charges: 3,
		enabled: true,
		passive_ability: false,
		toggle_ability: false,
		ability: function() {
			with (obj_player) {
				var dir_x = 0;
				var dir_y = 0;
				if (abs(var_x_movement) > abs(var_y_movement)) dir_x = sign(var_x_movement) * obj_Movable_rock.sprite_width / 2;
				else dir_y = sign(var_y_movement) * obj_Movable_rock.sprite_width / 2;
				
				var rock = instance_place(x + dir_x, y + dir_y, obj_Movable_rock);

				if (instance_exists(rock) && !place_meeting(x - dir_x, y - dir_y, var_collision_tilemap)) {
					x -= dir_x;
					y -= dir_y;
					rock.x -= dir_x;
					rock.y -= dir_y;
				}
			}
		}
	},
	{ 
		name: "Cool Mask", 
		sprite: Mask_cool, 
		description: "You just... look cool I guess?",
		charges: 0,
		passive_ability: true,
		ability: function() {
			
		}
	}
	];

global.masks_backup = [
	{
		name: "Empty Mask",
		sprite: Sprite_blank,
		description: "Unequips your mask.", 
		charges: 0,
		enabled: true,
		passive_ability: true,
		ability: function() {
			
		}
	},
	{	
		name: "Smiley Mask", 
		sprite: Mask_smiley, 
		description: "Lets you push blocks.", 
		charges: 3,
		enabled: true,
		passive_ability: false,
		toggle_ability: true,
		ability: function() {
			with (obj_player) {
				var dir_x = 0;
				var dir_y = 0;
				if (abs(var_x_movement) > abs(var_y_movement)) dir_x = sign(var_x_movement) * obj_Movable_rock.sprite_width / 2;
				else dir_y = sign(var_y_movement) * obj_Movable_rock.sprite_width / 2;
				
				var rock = instance_place(x + dir_x, y + dir_y, obj_Movable_rock);

				if (instance_exists(rock) && !place_meeting(rock.x + dir_x, rock.y + dir_y, [layer_tilemap_get_id("Tile_Upper"), layer_tilemap_get_id("Tile_Walls")])) {
					rock.x += dir_x;
					rock.y += dir_y;
				}
			}
		}
	},
	{ 
		name: "Sad Mask",
		sprite: Mask_sad, 
		description: "Lets you pull blocks.", 
		charges: 3,
		enabled: true,
		passive_ability: false,
		toggle_ability: false,
		ability: function() {
			with (obj_player) {
				var dir_x = 0;
				var dir_y = 0;
				if (abs(var_x_movement) > abs(var_y_movement)) dir_x = sign(var_x_movement) * obj_Movable_rock.sprite_width / 2;
				else dir_y = sign(var_y_movement) * obj_Movable_rock.sprite_width / 2;
				
				var rock = instance_place(x + dir_x, y + dir_y, obj_Movable_rock);

				if (instance_exists(rock) && !place_meeting(x - dir_x, y - dir_y, var_collision_tilemap)) {
					x -= dir_x;
					y -= dir_y;
					rock.x -= dir_x;
					rock.y -= dir_y;
				}
			}
		}
	},
	{ 
		name: "Smilier Mask", 
		sprite: Mask_smilier, 
		description: "Lets you jump.",
		charges: 2,
		enabled: false,
		passive_ability: false,
		ability: function() {
			
		}
	},
	{ 
		name: "Cool Mask", 
		sprite: Mask_cool, 
		description: "You just... look cool I guess?",
		charges: 0,
		passive_ability: true,
		ability: function() {
			
		}
	},
	{ 
		name: "Cat Mask", 
		sprite: Mask_cat, 
		enabled: false,
		description: "Shrinks you down, letting you crawl under tight spaces.",
		charges: 0,
		passive_ability: true,
		ability: function() {
			
		}
	}
	];
	
global.mask_data = global.masks[0];