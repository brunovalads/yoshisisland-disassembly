import sys

def output_graphics(gfx, low, fw):
    with open(gfx, "rb") as f:
        wbyte = 0x00
        wpos_low = False
        rbyte = f.read(1)
        while rbyte:
            # read correct nibble
            nib = ord(rbyte)
            if not low:
                nib >>= 4

            nib &= 0x0F

            # write to correct nibble
            if wpos_low:
                wbyte |= nib
                fw.write(chr(wbyte))
                # restart the write byte
                wbyte = 0x00
            else:
                wbyte |= (nib << 4) & 0xF0

            wpos_low = not wpos_low
            rbyte = f.read(1)

fw = open(sys.argv[2], 'ab')
output_graphics(sys.argv[1], True, fw)
output_graphics(sys.argv[1], False, fw)
fw.close()