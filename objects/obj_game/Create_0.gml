tile_size = 16;

global.masks = [
	{
		name: "Empty Mask",
		sprite: Sprite_blank,
		description: "Unequips your mask.", 
		charges: 0,
		ability: function() {
			
		}
	},
	{	
		name: "Smiley Mask", 
		sprite: Mask_smiley, 
		description: "Lets you push blocks.", 
		charges: 3,
		ability: function() {
			var rocks = []
			for (var i = 0; i < array_length(global.player_collisions); i++) {
				if (array_contains(asset_get_tags(global.player_collisions[i]), "Movable_rock")) {
					array_push(rocks, global.player_collisions[i])
				}
			}
					
			
			// Step 1: Get movement direction (only -1, 0, or 1)
			var dir_x = 0;
			var dir_y = 0;

			if (var_x_movement > 0) dir_x = 1;
			else if (var_x_movement < 0) dir_x = -1;

			if (var_y_movement > 0) dir_y = 1;
			else if (var_y_movement < 0) dir_y = -1;

			// Step 2: Find rock directly in that direction
			var strongest_rock = noone;
			var smallest_dist = 1000000000; // large number to find closest

			
			for (var i = 0; i < array_length(rocks); i++) {
			    var rock = rocks[i];
			    var diff_x = rock.x - x;
			    var diff_y = rock.y - y;

			    if (dir_x != 0 && dir_y == 0) {
			        // horizontal push: rock must be in same horizontal line (allow small vertical error)
			        if (abs(diff_y) < tile_size / 2 && sign(diff_x) == dir_x) {
			            var dist = abs(diff_x);
			            if (dist < smallest_dist) {
			                smallest_dist = dist;
			                strongest_rock = rock;
			            }
			        }
			    } else if (dir_y != 0 && dir_x == 0) {
			        // vertical push: rock must be in same vertical line (allow small horizontal error)
			        if (abs(diff_x) < tile_size / 2 && sign(diff_y) == dir_y) {
			            var dist = abs(diff_y);
			            if (dist < smallest_dist) {
			                smallest_dist = dist;
			                strongest_rock = rock;
			            }
			        }
			    }
			}

			// Step 3: Check if rock can move 1 tile in direction without collision
			if (strongest_rock != noone) {
			    var new_x = strongest_rock.x + dir_x * tile_size;
			    var new_y = strongest_rock.y + dir_y * tile_size;

			    // Temporarily move rock to new position and check collisions
			    // Save old position
			    var old_x = strongest_rock.x;
			    var old_y = strongest_rock.y;

			    strongest_rock.x = new_x;
			    strongest_rock.y = new_y;

			    var can_move = !place_meeting(strongest_rock.x, strongest_rock.y, obj_solid); 
			    // obj_solid is your blocking object parent or whatever blocks movement

			    // Revert position
			    strongest_rock.x = old_x;
			    strongest_rock.y = old_y;

			    // Move if free
			    if (can_move) {
			        strongest_rock.x = new_x;
			        strongest_rock.y = new_y;
			    }
			}

			
		},
		unequip_sequence: function() {
			
		}
	},
	{ 
		name: "Sad Mask",
		sprite: Mask_sad, 
		description: "Lets you pull blocks.", 
		charges: 3,
		ability: function() {
			
		},
		unequip_sequence: function() {
			
		}
	},
	{ 
		name: "Smilier Mask", 
		sprite: Mask_smilier, 
		description: "Lets you jump.",
		charges: 2,
		ability: function() {
			
		},
		unequip_sequence: function() {
			
		}
	},
	{ 
		name: "Cool Mask", 
		sprite: Mask_cool, 
		description: "You just... look cool I guess?",
		charges: 1,
		ability: function() {
			
		}
	},
	{ 
		name: "Cat Mask", 
		sprite: Mask_cat, 
		description: "Lets you crawl under tight spaces.",
		charges: 0,
		ability: function() {
			
		},
		unequip_sequence: function() {
			
		}
	}
	]