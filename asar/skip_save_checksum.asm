lorom

; bypasses actual save data checksum check
org $108032
db $80

; bypasses backup save data checksum check
org $1080C0
NOP #2