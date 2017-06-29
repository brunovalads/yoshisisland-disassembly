; Work RAM (WRAM) General defines
;
; More info available at
; https://www.smwcentral.net/?p=nmap&m=yiram
; _l for long ($bbaaaa)
; _dp for direct page ($dd)
;

!r_frame_counter_global = $0030
    !r_frame_counter_global_dp = $30
!r_frame_counter_global_l = $7E0030

!r_level_obj_ptr = $0032
    !r_level_obj_ptr_dp = $32
!r_level_obj_ptr_l = $7E0032

!r_joy1_lo_mirror = $0035
    !r_joy1_lo_mirror_dp = $35
!r_joy1_lo_mirror_l = $7E0035

!r_joy1_hi_mirror = $0036
    !r_joy1_hi_mirror_dp = $36
!r_joy1_hi_mirror_l = $7E0036

!r_joy1_lo_press_mirror = $0037
    !r_joy1_lo_press_mirror_dp = $37
!r_joy1_lo_press_mirror_l = $7E0037

!r_joy1_hi_press_mirror = $0038
    !r_joy1_hi_press_mirror_dp = $38
!r_joy1_hi_press_mirror_l = $7E0038

!r_bg1_cam_x = $0039
    !r_bg1_cam_x_dp = $39
!r_bg1_cam_x_l = $7E0039

!r_bg1_cam_y = $003B
    !r_bg1_cam_y_dp = $3B
!r_bg1_cam_y_l = $7E003B

!r_bg2_cam_x = $003D
    !r_bg2_cam_x_dp = $3D
!r_bg2_cam_x_l = $7E003D

!r_bg2_cam_y = $003F
    !r_bg2_cam_y_dp = $3F
!r_bg2_cam_y_l = $7E003F

!r_bg3_cam_x = $0041
    !r_bg3_cam_x_dp = $41
!r_bg3_cam_x_l = $7E0041

!r_bg3_cam_y = $0043
    !r_bg3_cam_y_dp = $43
!r_bg3_cam_y_l = $7E0043

!r_bg4_cam_x = $0045
    !r_bg4_cam_x_dp = $45
!r_bg4_cam_x_l = $7E0045

!r_bg4_cam_y = $0047
    !r_bg4_cam_y_dp = $47
!r_bg4_cam_y_l = $7E0047

!r_apu_io_0_mirror = $004D
    !r_apu_io_0_mirror_dp = $4D
!r_apu_io_0_mirror_l = $7E004D

!r_apu_io_0_mirror_prev = $004F
    !r_apu_io_0_mirror_prev_dp = $4F
!r_apu_io_0_mirror_prev_l = $7E004F

!r_apu_io_1_mirror = $0051
    !r_apu_io_1_mirror_dp = $51
!r_apu_io_1_mirror_l = $7E0051

!r_apu_io_2_mirror = $0053
    !r_apu_io_2_mirror_dp = $53
!r_apu_io_2_mirror_l = $7E0053

!r_apu_io_2_mirror_prev = $0055
    !r_apu_io_2_mirror_prev_dp = $55
!r_apu_io_2_mirror_prev_l = $7E0055

!r_sound_queue_size = $0057
    !r_sound_queue_size_dp = $57
!r_sound_queue_size_l = $7E0057

!r_sound_queue = $0059
    !r_sound_queue_dp = $59
!r_sound_queue_l = $7E0059

!r_player_jump_state = $006B
    !r_player_jump_state_dp = $6B
!r_player_jump_state_l = $7E006B

!r_cam_moving_dir_x = $0073
    !r_cam_moving_dir_x_dp = $73
!r_cam_moving_dir_x_l = $7E0073

!r_cam_moving_dir_y = $0075
    !r_cam_moving_dir_y_dp = $75
!r_cam_moving_dir_y_l = $7E0075

!r_new_column_flag = $0077
    !r_new_column_flag_dp = $77
!r_new_column_flag_l = $7E0077

!r_new_row_flag = $0079
    !r_new_row_flag_dp = $79
!r_new_row_flag_l = $7E0079

!r_game_over_state = $0089
    !r_game_over_state_dp = $89
!r_game_over_state_l = $7E0089

!r_game_mode = $0118
!r_game_mode_l = $7E0118

!r_game_loop_complete = $011B
!r_game_loop_complete_l = $7E011B

!r_interrupt_mode = $011C
!r_interrupt_mode_l = $7E011C

!r_reg_bg1hofs_mirror = $011D
!r_reg_bg1hofs_mirror_l = $7E011D

!r_reg_bg1vofs_mirror = $011F
!r_reg_bg1vofs_mirror_l = $7E011F

!r_stage_intro_flag = $0121
!r_stage_intro_flag_l = $7E0121

!r_irq_count = $0125
!r_irq_count_l = $7E0125

!r_irq_setting = $0126
!r_irq_setting_l = $7E0126

!r_header_table = $0134
!r_header_table_l = $7E0134

!r_header_bg_color = $0134
!r_header_bg_color_l = $7E0134

!r_header_bg1_tileset = $0136
!r_header_bg1_tileset_l = $7E0136

!r_header_bg1_palette = $0138
!r_header_bg1_palette_l = $7E0138

!r_header_bg2_tileset = $013A
!r_header_bg2_tileset_l = $7E013A

!r_header_bg2_palette = $013C
!r_header_bg2_palette_l = $7E013C

!r_header_bg3_tileset = $013E
!r_header_bg3_tileset_l = $7E013E

!r_header_bg3_palette = $0140
!r_header_bg3_palette_l = $7E0140

!r_header_spr_tileset = $0142
!r_header_spr_tileset_l = $7E0142

!r_header_spr_palette = $0144
!r_header_spr_palette_l = $7E0144

!r_header_level_mode = $0146
!r_header_level_mode_l = $7E0146

!r_header_anim_tileset = $0148
!r_header_anim_tileset_l = $7E0148

!r_header_anim_palette = $014A
!r_header_anim_palette_l = $7E014A

!r_header_bg_scrolling = $014C
!r_header_bg_scrolling_l = $7E014C

!r_header_music = $014E
!r_header_music_l = $7E014E

!r_header_item_memory = $0150
!r_header_item_memory_l = $7E0150

!r_header_unused = $0152
!r_header_unused_l = $7E0152

!r_reg_inidisp_mirror = $0200
!r_reg_inidisp_mirror_l = $7E0200

!r_spc_block_set = $0203
!r_spc_block_set_l = $7E0203

!r_spc_blocks = $0207
!r_spc_blocks_l = $7E0207

!r_bonus_game_type = $0212
!r_bonus_game_type_l = $7E0212

!r_last_world_unlocked = $0216
!r_last_world_unlocked_l = $7E0216

!r_cur_world = $0218
!r_cur_world_l = $7E0218

!r_cur_stage = $021A
!r_cur_stage_l = $7E021A

!r_stages_unlocked = $0222
!r_stages_unlocked_l = $7E0222


!r_stage_scores = $02B8
!r_stage_scores_l = $7E02B8


!r_cur_save_file = $030E
!r_cur_save_file_l = $7E030E

!r_map_icon_gfx = $030F
!r_map_icon_gfx_l = $7E030F


!r_pause_items = $0357
!r_pause_items_l = $7E0357


!r_tutorial_msg_flags = $0372
!r_tutorial_msg_flags_l = $7E0372


!r_extra_lives = $0379
!r_extra_lives_l = $7E0379

!r_coins_collected = $037B
!r_coins_collected_l = $7E037B

!r_death_count = $037D
!r_death_count_l = $7E037D

!r_1ups_collected = $037F
!r_1ups_collected_l = $7E037F


!r_yoshi_color = $0383
!r_yoshi_color_l = $7E0383


!r_level_load_type = $038C
!r_level_load_type_l = $7E038C

!r_cur_screen_exit = $038E
!r_cur_screen_exit_l = $7E038E


!r_star_autoincrease = $0396
!r_star_autoincrease_l = $7E0396


!r_cur_item_used = $0398
!r_cur_item_used_l = $7E0398

!r_item_use_counter = $039C
!r_item_use_counter_l = $7E039C


!r_red_coins_amount = $03B4
!r_red_coins_amount_l = $7E03B4

!r_stars_amount = $03B6
!r_stars_amount_l = $7E03B6

!r_flowers_amount = $03B8
!r_flowers_amount_l = $7E03B8


!r_cur_item_mem_page = $03BE
!r_cur_item_mem_page_l = $7E03BE

!r_item_mem_page0 = $03C0
!r_item_mem_page0_l = $7E03C0

!r_item_mem_page1 = $0440
!r_item_mem_page1_l = $7E0440

!r_item_mem_page2 = $04C0
!r_item_mem_page2_l = $7E04C0

!r_item_mem_page3 = $0540
!r_item_mem_page3_l = $7E0540


!r_cur_egg_follow_index = $05C0
!r_cur_egg_follow_index_l = $7E05C0

!r_eggs_x_follow_buffer = $05C2
!r_eggs_x_follow_buffer_l = $7E05C2

!r_eggs_y_follow_buffer = $06EA
!r_eggs_y_follow_buffer_l = $7E06EA


!r_joy1_lo = $093C
!r_joy1_lo_l = $7E093C

!r_joy1_hi = $093D
!r_joy1_hi_l = $7E093D

!r_joy1_lo_press = $093E
!r_joy1_lo_press_l = $7E093E

!r_joy1_hi_press = $093F
!r_joy1_hi_press_l = $7E093F


!r_joy2_lo = $0940
!r_joy2_lo_l = $7E0940

!r_joy2_hi = $0941
!r_joy2_hi_l = $7E0941

!r_joy2_lo_press = $0942
!r_joy2_lo_press_l = $7E0942

!r_joy2_hi_press = $0943
!r_joy2_hi_press_l = $7E0943


!r_joy1_lo_prev = $0944
!r_joy1_lo_prev_l = $7E0944

!r_joy1_hi_prev = $0945
!r_joy1_hi_prev_l = $7E0945


!r_joy2_lo_prev = $0946
!r_joy2_lo_prev_l = $7E0946

!r_joy2_hi_prev = $0947
!r_joy2_hi_prev_l = $7E0947


!r_reg_coldata_mirror = $0948
!r_reg_coldata_mirror_l = $7E0948


!r_reg_hdmaen_mirror = $094A
!r_reg_hdmaen_mirror_l = $7E094A

!r_reg_obsel_mirror = $094B
!r_reg_obsel_mirror_l = $7E094B

!r_reg_wbglog_mirror = $094C
!r_reg_wbglog_mirror_l = $7E094C

!r_reg_wobjlog_mirror = $094D
!r_reg_wobjlog_mirror_l = $7E094D

!r_reg_m7sel_mirror = $094E
!r_reg_m7sel_mirror_l = $7E094E

!r_reg_m7a_mirror = $094F
!r_reg_m7a_mirror_l = $7E094F

!r_reg_m7b_mirror = $0951
!r_reg_m7b_mirror_l = $7E0951

!r_reg_m7c_mirror = $0953
!r_reg_m7c_mirror_l = $7E0953

!r_reg_m7d_mirror = $0955
!r_reg_m7d_mirror_l = $7E0955

!r_reg_m7x_mirror = $0957
!r_reg_m7x_mirror_l = $7E0957

!r_reg_m7y_mirror = $0959
!r_reg_m7y_mirror_l = $7E0959

!r_reg_mosaic_mirror = $095B
!r_reg_mosaic_mirror_l = $7E095B

!r_reg_bgmode_mirror = $095E
!r_reg_bgmode_mirror_l = $7E095E

!r_reg_bg1sc_mirror = $095F
!r_reg_bg1sc_mirror_l = $7E095F

!r_reg_bg2sc_mirror = $0960
!r_reg_bg2sc_mirror_l = $7E0960

!r_reg_bg3sc_mirror = $0961
!r_reg_bg3sc_mirror_l = $7E0961

!r_reg_bg12nba_mirror = $0962
!r_reg_bg12nba_mirror_l = $7E0962

!r_reg_bg34nba_mirror = $0963
!r_reg_bg34nba_mirror_l = $7E0963

!r_reg_w12sel_mirror = $0964
!r_reg_w12sel_mirror_l = $7E0964

!r_reg_w34sel_mirror = $0965
!r_reg_w34sel_mirror_l = $7E0965

!r_reg_wobjsel_mirror = $0966
!r_reg_wobjsel_mirror_l = $7E0966

!r_reg_tm_mirror = $0967
!r_reg_tm_mirror_l = $7E0967

!r_reg_ts_mirror = $0968
!r_reg_ts_mirror_l = $7E0968

!r_reg_tmw_mirror = $0969
!r_reg_tmw_mirror_l = $7E0969

!r_reg_tsw_mirror = $096A
!r_reg_tsw_mirror_l = $7E096A

!r_reg_cgwsel_mirror = $096B
!r_reg_cgwsel_mirror_l = $7E096B

!r_reg_cgadsub_mirror = $096C
!r_reg_cgadsub_mirror_l = $7E096C


!r_pause_menu_state = $0B0F
!r_pause_menu_state_l = $7E0B0F

!r_pause_menu_flag = $0B10
!r_pause_menu_flag_l = $7E0B10

!r_pause_item_disable = $0B48
!r_pause_item_disable_l = $7E0B48

!r_anim_tileset_timer = $0B67
; !r_anim_tileset_timer_l = $7E0B67

!r_idle_frame_counter = $0B7D
!r_idle_frame_counter_l = $7E0B7D

!r_starcounter_timer = $0B7F
!r_starcounter_timer_l = $7E0B7F

!r_starcounter_side = $0B81
!r_starcounter_side_l = $7E0B81


!r_active_special_sprites = $0C04
!r_active_special_sprites_l = $7E0C04


!r_cur_autoscr = $0C1C
!r_cur_autoscr_l = $7E0C1C

!r_autoscr_x_active = $0C1E
!r_autoscr_x_active_l = $7E0C1E

!r_autoscr_y_active = $0C20
!r_autoscr_y_active_l = $7E0C20

!r_autoscr_x_cam = $0C22
!r_autoscr_x_cam_l = $7E0C22

!r_autoscr_y_cam = $0C26
!r_autoscr_y_cam_l = $7E0C26

!r_autoscr_x_speed = $0C2A
!r_autoscr_x_speed_l = $7E0C2A

!r_autoscr_y_speed = $0C2C
!r_autoscr_y_speed_l = $7E0C2C

!r_autoscr_dest_index = $0C2E
!r_autoscr_dest_index_l = $7E0C2E

!r_autoscr_x_dest = $0C30
!r_autoscr_x_dest_l = $7E0C30

!r_autoscr_y_dest = $0C32
!r_autoscr_y_dest_l = $7E0C32

!r_autoscr_dest_speed = $0C34
!r_autoscr_dest_speed_l = $7E0C34

!r_autoscr_x_dest_delta = $0C36
!r_autoscr_x_dest_delta_l = $7E0C36

!r_autoscr_y_dest_delta = $0C38
!r_autoscr_y_dest_delta_l = $7E0C38


!r_gusty_gen_flag = $0C3A
!r_gusty_gen_flag_l = $7E0C3A

!r_lakitu_gen_flag = $0C3C
!r_lakitu_gen_flag_l = $7E0C3C

!r_fuzzy_gen_flag = $0C3E
!r_fuzzy_gen_flag_l = $7E0C3E


!r_fuzzy_x_cam_prev = $0C44
!r_fuzzy_x_cam_prev_l = $7E0C44

!r_poochy_gen_flag = $0C46
!r_poochy_gen_flag_l = $7E0C46

!r_bat_gen_flag = $0C48
!r_bat_gen_flag_l = $7E0C48

!r_bat_gen_amount = $0C4A
!r_bat_gen_amount_l = $7E0C4A


; !r_spcsprite_unknown_1 = $0C4C
; !r_spcsprite_unknown_1_l = $7E0C4C


!r_fire_lakitu_gen_flag = $0C68
!r_fire_lakitu_gen_flag_l = $7E0C68

!r_flutter_gen_flag = $0C6A
!r_flutter_gen_flag_l = $7E0C6A

!r_nipper_gen_flag = $0C6E
!r_nipper_gen_flag_l = $7E0C6E

!r_balloon_pokey_gen_flag = $0C70
!r_balloon_pokey_gen_flag_l = $7E0C70

!r_balloon_missile_gen_flag = $0C72
!r_balloon_missile_gen_flag_l = $7E0C72

!r_balloon_gen_flag = $0C74
!r_balloon_gen_flag_l = $7E0C74

!r_yellow_platform_gen_flag = $0C76
!r_yellow_platform_gen_flag_l = $7E0C76

!r_slime_gen_flag = $0C78
!r_slime_gen_flag_l = $7E0C78


; !r_spcsprite_unknown_2 = $0C7C
; !r_spcsprite_unknown_2_l = $7E0C7C

; !r_spcsprite_unknown_3 = $0C7E
; !r_spcsprite_unknown_3_l = $7E0C7E


!r_y_cam_offset = $0CB0
!r_y_cam_offset_l = $7E0CB0

!r_switch_timer = $0CEC
!r_switch_timer_l = $7E0CEC

!r_fuzzy_opt_wave_amp = $0CFF
!r_fuzzy_opt_wave_amp_l = $7E0CFF

!r_fuzzy_opt_wave_offset = $0D01
!r_fuzzy_opt_wave_offset_l = $7E0D01

!r_fuzzy_tint_time = $0D03
!r_fuzzy_tint_time_l = $7E0D03

!r_bg_gradient_y_lower = $0D09
!r_bg_gradient_y_lower_l = $7E0D09

!r_bg_gradient_y_upper = $0D0B
!r_bg_gradient_y_upper_l = $7E0D0B

!r_msg_box_state = $0D0F
!r_msg_box_state_l = $7E0D0F

!r_msg_box_mask_size = $0D19
!r_msg_box_mask_size_l = $7E0D19
