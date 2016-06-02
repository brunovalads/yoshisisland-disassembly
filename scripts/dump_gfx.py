# this script dumps all graphics within a Yoshi's Island ROM
# to separate .bin files
# split up into uncompressed vs. compressed
# uncompressed are just hardcoded banks
# compressed relies on text files for addresses

from romutils import slice_of_rom, open_rom
import sys

def parse_addrs_gfx(file):
    addrs = []
    with open(file, 'r+') as f:
        for line in f.readlines():
            addr_line = [l for l in line.split() if l]
            addrs.append((
                int(addr_line[0], 16),     # address
                int(addr_line[1], 10),     # length
                int(addr_line[2], 16),     # file number
                addr_line[3],              # description
                addr_line[4]               # size
                ))

    return addrs

def dump_gfx_file(content, compression, addr_info, incbin):
    file = '{0}-{1}-{2}-{3}.bin'.format(
        compression,
        format(addr_info[2],'03X'),
        addr_info[3],
        addr_info[4])

    # write file
    with open('gfx/' + file, 'wb') as f:
        f.write(content)

    # write into inc asm, detect bank crossing
    bank_start = addr_info[0] & 0xFF0000
    addr_end = addr_info[0] + addr_info[1] - 1
    bank_end = addr_end & 0xFF0000
    bank_end_real = format(bank_end + 0x8000, '06X')
    if bank_end > bank_start:
        middle = format(bank_end - addr_info[0], '04X')
        end = format(addr_info[1], '04X')
        incbin.write('incbin {0}:0000-{1}\n\n'.format(file, middle))
        incbin.write('org ${0}\n'.format(bank_end_real))
        incbin.write('incbin {0}:{1}-{2}\n'.format(file, middle, end))
    else:
        incbin.write('incbin {0}\n'.format(file))

def dump_gfx_files(rom, compression, txt):
    addrs = parse_addrs_gfx(txt)
    with open('gfx/' + compression + '.asm', 'w') as incbin:
        for addr_info in addrs:
            content = slice_of_rom(rom, addr_info[0], addr_info[1])
            dump_gfx_file(content, compression, addr_info, incbin)

def dump_bitmap(rom, addr, length, filename):
    content = slice_of_rom(rom, addr, length)
    with open('gfx/' + filename, 'wb') as f:
        f.write(content)

def dump_bitmaps(rom):
    dump_bitmap(rom, 0x248000, 0x8000, 'bank24-4bpp.bin')
    dump_bitmap(rom, 0x258000, 0x8000, 'bank25-4bpp.bin')
    dump_bitmap(rom, 0x268000, 0x8000, 'bank26-gsu.bin')
    dump_bitmap(rom, 0x278000, 0x4000, 'bank27-gsu.bin')
    dump_bitmap(rom, 0x27C000, 0x4000, 'bank27-4bpp.bin')
    dump_bitmap(rom, 0x288000, 0x8000, 'bank28-gsu.bin')
    dump_bitmap(rom, 0x298000, 0x8000, 'bank29-gsu.bin')
    dump_bitmap(rom, 0x2A8000, 0x8000, 'bank2A-gsu.bin')
    dump_bitmap(rom, 0x2B8000, 0x8000, 'bank2B-gsu.bin')
    dump_bitmap(rom, 0x2C8000, 0x8000, 'bank2C-gsu.bin')
    dump_bitmap(rom, 0x2D8000, 0x6800, 'bank2D-2bpp.bin')
    dump_bitmap(rom, 0x2DE800, 0x1800, 'bank2D-4bpp.bin')
    dump_bitmap(rom, 0x2E8000, 0x3C00, 'bank2E-gsu.bin')

if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print 'Usage: python dump_gfx.py romname'
        sys.exit()
    rom = open_rom(sys.argv[1])
    dump_bitmaps(rom)
    dump_gfx_files(rom, 'lz1', 'lc_lz1.txt')
    dump_gfx_files(rom, 'lz16', 'lc_lz16.txt')