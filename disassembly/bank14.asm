; level data bank
org $148000

  incbin level/level-03-obj.bin             ; $148000 |
  incbin level/level-3D-obj.bin             ; $1484B6 |
  incbin level/level-6E-obj.bin             ; $14856D |
  incbin level/level-99-obj.bin             ; $14861B |
  incbin level/level-03-spr.bin             ; $14869D |
  incbin level/level-3D-spr.bin             ; $14878F |
  incbin level/level-6E-spr.bin             ; $14879A |
  incbin level/level-99-spr.bin             ; $1487C3 |
  incbin level/level-0A-obj.bin             ; $1487D4 |
  incbin level/level-42-obj.bin             ; $148D0D |
  incbin level/level-72-obj.bin             ; $148FF0 |
  incbin level/level-0A-spr.bin             ; $1493BF |
  incbin level/level-42-spr.bin             ; $1494B7 |
  incbin level/level-72-spr.bin             ; $14951C |
  incbin level/level-0F-obj.bin             ; $14960E |
  incbin level/level-47-obj.bin             ; $149D38 |
  incbin level/level-77-obj.bin             ; $149F1F |
  incbin level/level-A0-obj.bin             ; $14A318 |
  incbin level/level-0F-spr.bin             ; $14A39B |
  incbin level/level-47-spr.bin             ; $14A4C3 |
  incbin level/level-77-spr.bin             ; $14A52E |
  incbin level/level-A0-spr.bin             ; $14A5A5 |
  incbin level/level-12-obj.bin             ; $14A5BC |
  incbin level/level-4A-obj.bin             ; $14A716 |
  incbin level/level-79-obj.bin             ; $14AB69 |
  incbin level/level-A2-obj.bin             ; $14ACFD |
  incbin level/level-12-spr.bin             ; $14AD4A |
  incbin level/level-4A-spr.bin             ; $14AD7C |
  incbin level/level-79-spr.bin             ; $14AE44 |
  incbin level/level-A2-spr.bin             ; $14AE76 |
  incbin level/level-13-obj.bin             ; $14AEA8 |
  incbin level/level-4B-obj.bin             ; $14B0CA |
  incbin level/level-13-spr.bin             ; $14B123 |
  incbin level/level-4B-spr.bin             ; $14B233 |
  incbin level/level-14-obj.bin             ; $14B23B |
  incbin level/level-4C-obj.bin             ; $14B56B |
  incbin level/level-7A-obj.bin             ; $14B9A1 |
  incbin level/level-14-spr.bin             ; $14BAE3 |
  incbin level/level-4C-spr.bin             ; $14BB57 |
  incbin level/level-7A-spr.bin             ; $14BC5E |
  incbin level/level-19-obj.bin             ; $14BD23 |
  incbin level/level-51-obj.bin             ; $14BD91 |
  incbin level/level-7F-obj.bin             ; $14C445 |
  incbin level/level-A7-obj.bin             ; $14C528 |
  incbin level/level-51-spr.bin             ; $14C5D9 |
  ;incbin level/level-19-spr.bin             ; $14C6C6 | $FFFF points to 51's data
  incbin level/level-7F-spr.bin             ; $14C6C8 |
  incbin level/level-A7-spr.bin             ; $14C6CD |
  incbin level/level-1B-obj.bin             ; $14C711 |
  incbin level/level-52-obj.bin             ; $14CA56 |
  incbin level/level-80-obj.bin             ; $14CD2E |
  incbin level/level-A8-obj.bin             ; $14D10A |
  incbin level/level-1B-spr.bin             ; $14D2C1 |
  incbin level/level-52-spr.bin             ; $14D377 |
  incbin level/level-80-spr.bin             ; $14D3B8 |
  incbin level/level-A8-spr.bin             ; $14D45F |
  incbin level/level-1C-obj.bin             ; $14D488 |
  incbin level/level-53-obj.bin             ; $14D4CA |
  incbin level/level-81-obj.bin             ; $14D9A0 |
  incbin level/level-A9-obj.bin             ; $14DD7D |
  incbin level/level-1C-spr.bin             ; $14DE8F |
  incbin level/level-53-spr.bin             ; $14DEA0 |
  incbin level/level-81-spr.bin             ; $14DF5C |
  incbin level/level-A9-spr.bin             ; $14E015 |
  incbin level/level-1F-obj.bin             ; $14E035 |
  incbin level/level-56-obj.bin             ; $14E5E9 |
  incbin level/level-83-obj.bin             ; $14E743 |
  incbin level/level-1F-spr.bin             ; $14E794 |
  incbin level/level-56-spr.bin             ; $14E88F |
  incbin level/level-83-spr.bin             ; $14E909 |
  incbin level/level-25-obj.bin             ; $14E920 |
  incbin level/level-5C-obj.bin             ; $14EA82 |
  incbin level/level-88-obj.bin             ; $14EBEC |
  incbin level/level-AE-obj.bin             ; $14EEAB |
  incbin level/level-25-spr.bin             ; $14EFF2 |
  incbin level/level-5C-spr.bin             ; $14F030 |
  incbin level/level-88-spr.bin             ; $14F095 |
  incbin level/level-AE-spr.bin             ; $14F127 |
  incbin level/level-33-obj.bin             ; $14F13E |
  incbin level/level-6A-obj.bin             ; $14F40E |
  incbin level/level-96-obj.bin             ; $14F9E1 |
  incbin level/level-B7-obj.bin             ; $14FBC0 |
  incbin level/level-33-spr.bin             ; $14FCB8 |
  incbin level/level-6A-spr.bin             ; $14FD17 |
  incbin level/level-96-spr.bin             ; $14FDF7 |
  incbin level/level-B7-spr.bin             ; $14FE86 |
  incbin level/level-36-obj.bin             ; $14FEC4 |
  incbin level/level-37-obj.bin             ; $14FF1F |
  incbin level/level-36-spr.bin             ; $14FF83 |
  incbin level/level-37-spr.bin             ; $14FF91 |

; freespace
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFA5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFAD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFB5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFBD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFC5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFCD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFD5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFDD |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFE5 |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFED |
  db $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF ; $14FFF5 |
  db $FF, $FF, $FF                          ; $14FFFD |
