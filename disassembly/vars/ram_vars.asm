; Work RAM (WRAM) General defines
;
; More info available at
; https://www.smwcentral.net/?p=nmap&m=yiram 
; _l for long ($bbaaaa)
; _dp for direct page ($dd)

!r_frame_counter_global = $0030
!r_level_obj_ptr = $0032

!r_joy1_lo_mirror = $0035
!r_joy1_hi_mirror = $0036
!r_joy1_lo_press_mirror = $0037
!r_joy1_hi_press_mirror = $0038

!r_bg1_cam_x = $0039
!r_bg1_cam_y = $003B
!r_bg2_cam_x = $003D
!r_bg2_cam_y = $003F
!r_bg3_cam_x = $0041
!r_bg3_cam_y = $0043
!r_bg4_cam_x = $0045
!r_bg4_cam_y = $0047

!r_apu_io_0_mirror = $004D
!r_apu_io_0_mirror_prev = $004F
!r_apu_io_1_mirror = $0051
!r_apu_io_2_mirror = $0053
!r_apu_io_2_mirror_prev = $0055
!r_sound_queue_size = $0057
!r_sound_queue = $0059

!r_player_jump_state = $006B
!r_cam_moving_dir_x = $0073
!r_cam_moving_dir_y = $0075
!r_new_column_flag = $0077
!r_new_row_flag = $0079

; !r_game_over_state = $0089
!r_game_mode = $0118
!r_game_loop_complete = $011B

; ?
!r_interrupt_mode = $011C

!r_reg_bg1hofs_mirror = $011D
!r_reg_bg1vofs_mirror = $011F
!r_stage_intro_flag = $0121
!r_irq_count = $0125
!r_irq_setting = $0126

!r_header_bg_color = $0134
!r_header_bg1_tileset = $0136
!r_header_bg1_palette = $0138
!r_header_bg2_tileset = $013A
!r_header_bg2_palette = $013C
!r_header_bg3_tileset = $013E
!r_header_bg3_palette = $0140
!r_header_spr_tileset = $0142
!r_header_spr_palette = $0144
!r_header_level_mode = $0146
!r_header_anim_tileset = $0148
!r_header_anim_palette = $014A
!r_header_bg_scrolling = $014C
!r_header_music = $014E
!r_header_item_memory = $0150
!r_header_unused = $0152

!r_reg_inidisp_mirror = $0200
!r_spc_block_set = $0203
!r_spc_blocks = $0207

!r_bonus_game_type = $0212

!r_last_world_unlocked = $0216
!r_cur_world = $0218
!r_cur_stage = $021A
!r_stages_unlocked = $0222

!r_stage_scores = $02B8

!r_cur_save_file = $030E
!r_map_icon_gfx = $030F

!r_pause_items = $0357

!r_tutorial_msg_flags = $0372

!r_extra_lives = $0379
!r_coins_collected = $037B
!r_1ups_collected = $037F

!r_yoshi_color= $0383

!r_level_load_type = $038C
!r_cur_screen_exit = $038E

!r_star_autoincrease = $0396

!r_cur_item_used = $0398
!r_item_use_counter = $039C

!r_red_coins_amount = $03B4
!r_stars_amount = $03B6
!r_flowers_amount = $03B8

!r_cur_item_mem_page = $03BE
!r_item_mem_page0 = $03C0
!r_item_mem_page1 = $0440
!r_item_mem_page2 = $04C0
!r_item_mem_page3 = $0540

!r_cur_egg_follow_index = $05C0
!r_eggs_x_follow_buffer = $05C2
!r_eggs_y_follow_buffer = $06EA

!r_joy1_lo = $093C
!r_joy1_hi = $093D
!r_joy1_lo_press = $093E
!r_joy1_hi_press = $093F

!r_joy2_lo = $0940
!r_joy2_hi = $0941
!r_joy2_lo_press = $0942
!r_joy2_hi_press = $0943

!r_joy1_lo_prev = $0944
!r_joy1_hi_prev = $0945

!r_joy2_lo_prev = $0946
!r_joy2_hi_prev = $0947

!r_reg_coldata_mirror = $0948

!r_reg_hdmaen_mirror = $094A
!r_reg_obsel_mirror = $094B
!r_reg_wbglog_mirror = $094C
!r_reg_wobjlog_mirror = $094D
!r_reg_m7sel_mirror = $094E
!r_reg_m7a_mirror = $094F
!r_reg_m7b_mirror = $0951
!r_reg_m7c_mirror = $0953
!r_reg_m7d_mirror = $0955
!r_reg_m7x_mirror = $0957
!r_reg_m7y_mirror = $0959
!r_reg_mosaic_mirror = $095B
!r_reg_bgmode_mirror = $095E
!r_reg_bg1sc_mirror = $095F
!r_reg_bg2sc_mirror = $0960
!r_reg_bg3sc_mirror = $0961
!r_reg_bg12nba_mirror = $0962
!r_reg_bg34nba_mirror = $0963
!r_reg_w12sel_mirror = $0964
!r_reg_w34sel_mirror = $0965
!r_reg_wobjsel_mirror = $0966
!r_reg_tm_mirror = $0967
!r_reg_ts_mirror = $0968
!r_reg_tmw_mirror = $0969
!r_reg_tsw_mirror = $096A
!r_reg_cgwsel_mirror = $096B
!r_reg_cgadsub_mirror = $096C

!r_pause_menu_state = $0B0F
!r_pause_menu_flag = $0B10
!r_pause_item_disable = $0B48
!r_idle_frame_counter = $0B7D
!r_starcounter_timer = $0B7F
!r_starcounter_side = $0B81

!r_active_special_sprites = $0C04

!r_cur_autoscr = $0C1C
!r_autoscr_x_active = $0C1E
!r_autoscr_y_active = $0C20
!r_autoscr_x_cam = $0C22
!r_autoscr_y_cam = $0C26
!r_autoscr_x_speed = $0C2A
!r_autoscr_y_speed = $0C2C
!r_autoscr_dest_index = $0C2E
!r_autoscr_x_dest = $0C30
!r_autoscr_y_dest = $0C32
!r_autoscr_dest_speed = $0C34
!r_autoscr_x_dest_delta = $0C36
!r_autoscr_y_dest_delta = $0C38

!r_gusty_gen_flag = $0C3A
!r_lakitu_gen_flag = $0C3C
!r_fuzzy_gen_flag = $0C3E

!r_fuzzy_x_cam_prev = $0C44
!r_poochy_gen_flag = $0C46
!r_bat_gen_flag = $0C48
!r_bat_gen_amount = $0C4A
; !r_spcsprite_unknown_1 = $0C4C

!r_fire_lakitu_gen_flag = $0C68
!r_flutter_gen_flag = $0C6A
!r_nipper_gen_flag = $0C6E
!r_balloon_pokey_gen_flag = $0C70
!r_balloon_missile_gen_flag = $0C72
!r_balloon_gen_flag = $0C74
!r_yellow_platform_gen_flag = $0C76
!r_slime_gen_flag = $0C78
; !r_spcsprite_unknown_2 = $0C7C
; !r_spcsprite_unknown_3 = $0C7E

!r_y_cam_offset = $0CB0
!r_switch_timer = $0CEC

!r_fuzzy_opt_wave_amp = $0CFF
!r_fuzzy_opt_wave_offset = $0D01

!r_bg_gradient_y_lower = $0D09
!r_bg_gradient_y_upper = $0D0B

!r_msg_box_state = $0D0F
!r_msg_box_mask_size = $0D19