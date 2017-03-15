; Cartridge RAM (SRAM) General defines
;
; More info available at
; https://www.smwcentral.net/?p=nmap&m=yisram
; _l for long ($bbaaaa)
; _dp for direct page ($dd)
; $6000 -> $7FFF = $700000 -> $701FFF 

!s_player_joy1_lo = $6070
!s_player_joy1_hi = $6071
!s_player_joy1_lo_press = $6072
!s_player_joy1_hi_press = $6073

!s_control_scheme = $6082

!s_player_x_sub = $608A
!s_player_x = $608C
!s_player_y_sub = $608E
!s_player_y = $6090

!s_oam_next_free_slot_ptr = $6092

!s_bg1_cam_x = $6094
!s_bg2_cam_x = $6096
!s_bg3_cam_x = $6098
!s_bg4_cam_x = $609A
!s_bg1_cam_y = $609C
!s_bg2_cam_y = $609E
!s_bg3_cam_y = $60A0
!s_bg4_cam_y = $60A2

!s_leftmost_tile_x = $60A4
!s_uppermost_tile_y = $60A6

!s_player_x_speed_prev = $60A8
!s_player_y_speed = $60AA

!s_player_state = $60AC
!s_player_form = $60AE

!s_player_x_cam_rel = $60B0
!s_player_y_cam_rel = $60B2

!s_player_x_speed = $60B4

!s_player_ground_angle = $60B6
!s_player_top_ground_angle = $60B8
!s_player_mid_ground_angle = $60BA
!s_player_low_ground_angle = $60BC

!s_player_cur_anim_frame = $60BE

!s_player_jump_state = $60C0
!s_player_duck_state = $60C2

!s_player_direction = $60C4
!s_player_dir_last_accel = $60CC

!s_player_looking_up_flag = $60CE

!s_player_flutter_state = $60D2
!s_player_extd_flutter_flag = $60D3

!s_player_ground_pound_state = $60D4
!s_player_ground_pound_counter = $60D6

!s_player_stair_state = $60DA

!s_player_pushing_counter = $60DC

!s_egg_throw_state = $60DE
!s_egg_cursor_radius = $60E0
!s_egg_cursor_x = $60E4
!s_egg_cursor_y = $60E6
!s_egg_cursor_cancel_counter = $60E8
!s_egg_cursor_locked_flag = $60EA
!s_egg_cursor_enable_flag = $60EC
!s_egg_cursor_angle = $60EE
!s_egg_cursor_angular_speed = $60F0

!s_player_stumble_amount = $60F2
!s_player_stumble_direction = $60F4

!s_player_idle_anim_state = $60F6
!s_player_running_anim_state = $60F8

!s_player_ground_type = $60FA

!s_player_tile_collision = $60FC
!s_player_water_collision = $60FE
!s_player_cross_collision = $6100

!s_on_spiky_stake_flag = $6102

!s_door_exit_type = $6104
!s_pipe_transition_type_lo = $6106
!s_pipe_transition_type_hi = $6107
!s_pipe_transition_dist_moved = $6108
!s_player_pipe_anim_state = $610A
!s_player_pipe_enter_accel = $610C
!s_player_pipe_x_pos_rel = $610E

!s_player_mud_walking = $6110

!s_car_wheel_ext_height = $6112

!s_player_center_x = $611C
!s_player_center_y = $611E
!s_player_hitbox_half_width = $6120
!s_player_hitbox_half_height = $6122

!s_player_transforming_flag = $614E

!s_player_mouth_state = $6150
!s_player_tongue_x_rel = $6152
!s_player_tongue_y_rel = $6154
!s_player_tongue_x = $615A
!s_player_tongue_y = $615C
!s_tongue_collision_state = $615E
!s_tongue_inedible_state = $6160
!s_tongued_sprite_slot = $6168

!s_mouth_ammo = $616A
!s_ammo_spitting_timer = $616C
!s_melon_freeze_timer = $616E
!s_ammo_counter = $6170
; !s_? = $6172
; !s_?? = $6174

!s_player_transform_misc = $6180

!s_player_disable_flag = $61AE
!s_sprite_disable_flag = $61B0

!s_baby_mario_state = $61B2

!s_on_sprite_platform_flag = $61B4
!s_on_sprite_platform_flag_prev = $61B8

!s_cam_y_small_shaking_timer = $61C6
!s_cam_y_large_shaking_timer = $61C8

!s_opt_mode = $61CA

!s_player_invincibility_timer = $61D6

!s_egg_throw_state_timer = $61E2

!s_swallow_timer = $61EE

!s_transform_timer = $61F4

!s_oam_buffer = $6200
!s_oam_lo_table_mirror = $6A00
!s_oam_hi_table_mirror = $6C00
!s_oam_hi_table_buffer = $6C20

!s_screen_num_to_id = $6CAA

; !s_ = $6DAA
; !s_ = $6DEA
; !s_ = $6E2A
; !s_ = $6E6E

!s_sprset_1_index = $6EB6
!s_sprset_2_index = $6EB7
!s_sprset_3_index = $6EB8
!s_sprset_4_index = $6EB9
!s_sprset_5_index = $6EBA
!s_sprset_6_index = $6EBB

!s_cur_spr_x_prev = $6EBC
!s_cur_spr_y_prev = $6EBE

!s_rng = $7970
!s_cur_sprite_slot = $7972
; !s_sprite_frame_counter = $7974

!s_cur_egg_inv_size = $7DF6
!s_cur_egg_inv_slots = $7DF8

!s_super_mario_timer = $7E04
!s_magnify_glass_flag = $7E06
!s_switch_state = $7E08
!s_cam_player_center_y = $7E0A
!s_cam_x_sub = $7E0C
!s_cam_x_delta = $7E0D
!s_cam_y_sub = $7E0E
!s_cam_y_delta = $7E0F

!s_player_x_sub_prev = $7E10
!s_player_x_prev = $7E12
!s_player_y_sub_prev = $7E14
!s_player_y_prev = $7E16
!s_cam_x_left_boundary = $7E18
!s_cam_x_right_boundary = $7E1A
!s_cam_y_upper_boundary = $7E1C
!s_cam_y_lower_boundary = $7E1E
!s_cam_x_window_min = $7E20
!s_cam_y_window_min = $7E22
!s_cam_y_scroll_timer = $7E24
!s_cam_event_flag = $7E2A
!s_cam_event_y_speed = $7E38
; !s_ = $7E40
; !s_ = $7E42
!s_opt_cam_x_offset = $7EEE
!s_opt_cam_y_offset = $7EF0
!s_opt_x_offsets = $7EF2
!s_opt_y_offsets = $7F32

!s_cgram_mirror = $702000