#region character movement
// horizontal and vertical inputs of the character.
hInput = keyboard_check(vk_right) - keyboard_check(vk_left);
vInput = keyboard_check(vk_down) - keyboard_check(vk_up);

move_x = hInput*spd;
move_y = vInput*spd;

#endregion character movement

#region collision checks
//if keyboard_check(vk_right) and place_free(x + hcollisioncheck, y)
//{
//	x += move_x;
//}
//if keyboard_check(vk_left) and place_free(x - hcollisioncheck, y)
//{
//	x += move_x;
//}
//if keyboard_check(vk_up) and place_free(x, y - vcollisioncheck)
//{
//	y += move_y;
//}
//if  keyboard_check(vk_down) and place_free(x, y + vcollisioncheck)
//{
//	y += move_y;
//}
#endregion collision checks

#region collision checks 2
if keyboard_check(vk_right) and !place_meeting(x + hcollisioncheck, y, [obj_wall, obj_stairs])
{
	x += move_x;
}
if keyboard_check(vk_left) and !place_meeting(x - hcollisioncheck, y, [obj_wall, obj_stairs])
{
	x += move_x;
}
if keyboard_check(vk_up) and !place_meeting(x, y - vcollisioncheck, [obj_wall, obj_stairs])
{
	y += move_y;
}
if  keyboard_check(vk_down) and !place_meeting(x, y + vcollisioncheck, [obj_wall, obj_stairs])
{
	y += move_y;
}
#endregion collision checks

#region sprite index and animation
// animate the character when movement keys are pressed, stop when keys are not pressed
if (hInput != 0) or (vInput != 0)
{
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}
// change sprite depending on which arrow key is pressed
if keyboard_check(vk_right) {
	sprite_index = spr_right
} else if keyboard_check(vk_left) {
	sprite_index = spr_left;
} else if keyboard_check(vk_up) {
	sprite_index = spr_back;
} else if keyboard_check(vk_down) {
	sprite_index = spr_front
}
#endregion sprite index and animation