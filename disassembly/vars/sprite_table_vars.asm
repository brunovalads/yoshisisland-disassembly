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
;!s_spr_????

!s_spr_priority_override = $70E0
!s_spr_x_subpixel_pos_lo = $70E0
!s_spr_x_subpixel_pos_hi = $70E1
!s_spr_x_pixel_pos = $70E2
!s_spr_x_screen_pos = $70E3

; !s_spr_
; !s_spr_
; !s_spr_
; !s_spr_