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

; !s_spr_unknown_bits = $701860
; !s_spr_unknown_bits = $701862

!s_spr_wildcard_1_lo = $7900
!s_spr_wildcard_1_hi = $7901
!s_spr_wildcard_2_lo = $7902
!s_spr_wildcard_2_hi = $7903

!s_spr_wildcard_3_lo = $7976
!s_spr_wildcard_3_hi = $7977
!s_spr_wildcard_4_lo = $7978
!s_spr_wildcard_4_hi = $7979

; s_spr_wildcard_3_lo_dp = $76

; !s_spr_
; !s_spr_