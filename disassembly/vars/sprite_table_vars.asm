; Cartridge RAM (SRAM) Sprite Tables
; Each table being 96 bytes long holding 24 4-byte entries with one sprite per
; Indexed by it's sprite slot ID
;
; More info available at
; http://www.smwcentral.net/?p=nmap&m=yisram&u=0#700F00 

!s_spr_state = $6F00
!s_spr_ground_angle = $6F02

!s_spr_bitwise_settings_1 = $6FA0
!s_spr_bitwise_settings_2 = $6FA1
!s_spr_bitwise_settings_3 = $6FA2
!s_spr_bitwise_settings_4 = $6FA3

!s_spr_oam_1 = $7040
!s_spr_oam_count = $7041
!s_spr_oam_yxppccct = $7042
; !s_spr_???? = $7043

!s_spr_priority_override = $70E0
!s_spr_x_subpixel_pos = $70E1
!s_spr_x_pixel_pos = $70E2
!s_spr_x_screen_pos = $70E3

!s_spr_obj_tile_index = $7180
!s_spr_y_subpixel_pos = $7181
!s_spr_y_pixel_pos = $7182
!s_spr_y_screen_pos = $7183

!s_spr_x_speed_lo = $7220
!s_spr_x_speed_hi = $7221
!s_spr_y_speed_lo = $7222
!s_spr_y_speed_hi = $7223

!s_spr_x_delta_lo = $72C0
!s_spr_x_delta_hi = $72C1
!s_spr_y_delta_lo = $72C2
!s_spr_y_delta_hi = $72C3

!s_spr_id = $7360
!s_spr_oam_pointer = $7362

!s_spr_facing_dir = $7400
!s_spr_anim_frame = $7402

!s_spr_stage_id = $74A0
!s_spr_bg_layer = $74A1
!s_spr_draw_priority = $74A2
; !s_spr_empty? = $74A3

!s_spr_x_accel = $7540
!s_spr_y_accel = $7542

!s_spr_x_accel_ceiling = $75E0
!s_spr_y_accel_ceiling = $75E2

!s_spr_cam_x_pos = $7680
!s_spr_cam_y_pos = $7682

!s_spr_y_terrain_offset = $7720
!s_spr_dyntile_index = $7722

; !s_spr_???? = $7017C0
!s_spr_timer_nopause = $77C1
!s_spr_x_player_dir = $77C2
!s_spr_y_player_dir = $77C3

; !s_spr_unknown_bits = $7860
; !s_spr_unknown_bits = $7862

!s_spr_wildcard_1_lo = $7900
!s_spr_wildcard_1_hi = $7901
!s_spr_wildcard_2_lo = $7902
!s_spr_wildcard_2_hi = $7903

!s_spr_wildcard_3_lo = $7976
!s_spr_wildcard_3_hi = $7977
!s_spr_wildcard_4_lo = $7978
!s_spr_wildcard_4_hi = $7979

!s_spr_wildcard_3_lo_dp = $16
!s_spr_wildcard_3_hi_dp = $17
!s_spr_wildcard_4_lo_dp = $18
!s_spr_wildcard_4_hi_dp = $19

!s_spr_wildcard_5_lo = $79D6
!s_spr_wildcard_5_hi = $79D7
!s_spr_wildcard_6_lo = $79D8
!s_spr_wildcard_6_hi = $79D9

!s_spr_wildcard_5_lo_dp = $76
!s_spr_wildcard_5_hi_dp = $77
!s_spr_wildcard_6_lo_dp = $78
!s_spr_wildcard_6_hi_dp = $79

!s_spr_gsu_morph_1_lo = $7A36
!s_spr_gsu_morph_1_hi = $7A37
!s_spr_gsu_morph_2_lo = $7A38
!s_spr_gsu_morph_2_hi = $7A39

!s_spr_timer_1 = $7A96
!s_spr_timer_2 = $7A98

!s_spr_timer_3 = $7AF6
!s_spr_timer_4 = $7AF8

!s_spr_x_hitbox_offset = $7B56
!s_spr_y_hitbox_offset = $7B58

!s_spr_x_player_delta = $7C16
!s_spr_y_player_delta = $7C18

!s_spr_x_collision_delta = $7C76
!s_spr_y_collision_delta = $7C78

!s_spr_x_hitbox_center = $7CD6
!s_spr_y_hitbox_center = $7CD8

!s_spr_collision_id = $7D36
; !s_spr_collision_???? = $7D37
!s_spr_collision_state = $7D38
; !s_spr_collision_??? = $7D39

!s_spr_timer_frozen = $7D96
; !s_spr_empty = $701D96