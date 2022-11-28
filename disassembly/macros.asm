function hirom_mirror(label) = $400000+(((bank(label))*$8000)+((label&$FFFF)-$8000))

function rom_to_wram_rt(wrambank, romlabel) = (romlabel&$FFFF)|((wrambank&$FF)<<16)
