if (place_meeting(x, y, obj_Movable_rock)) {
	global.goals1 = true;
}
else global.goals1 = false;

if (global.goals1 && global.goals2) room_goto(Title_Screen);