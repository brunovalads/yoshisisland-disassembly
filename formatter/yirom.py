# this script requires gfx/ folder to be present
# and yi.sfc as a clean YI ROM

def snes_to_pc(addr):
    bank = (addr & 0xFF0000) >> 16
    absolute = (addr & 0x00FFFF)
    abs_corrected = absolute - 0x8000 * (1 - bank % 2)
    return (bank << 15) | abs_corrected

def pc_to_snes(addr):
    bank = (addr & 0xFF0000) * 2 + (addr & 0x008000) * 2
    absolute = addr & 0x00FFFF
    abs_corrected = absolute + 0x008000 - (absolute & 0x008000)
    return bank | abs_corrected

def dickbutt_to_pc(addr):
    return addr - 0x400000

def open_rom(file):
    with open(file, 'rb') as f:
        return f.read()

def slice_of_rom(rom, addr, length):
    addr = snes_to_pc(addr)
    return rom[addr:addr+length]

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

def dump_gfx_files(rom, compression, romfile, txt):
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

def dump_levels(rom, obj_file, sprite_file):
    level_addrs_obj = parse_addrs_level(obj_file)
    level = 0
    for addr in level_addrs_obj:
        dump_obj_level(rom, level, addr)
        level += 1
    level_addrs_spr = parse_addrs_level(sprite_file)
    level = 0
    for addr in level_addrs_spr:
        dump_sprite_level(rom, level, addr)
        level += 1

def parse_addrs_level(file):
    with open(file, 'r+') as f:
        return [int(l, 16) for l in f.readlines()]

def header_value(header, start, length):
    local_index = 0
    header_val = 0x00
    for total_index in range(start, start + length):
        byte_index = total_index / 8
        bit_index = total_index % 8
        bit = header[byte_index] & (0x01 << (7 - bit_index))
        if bit != 0x00:
            header_val |= 0x01 << (length - 1 - local_index)
        local_index += 1

    return header_val

level_obj_table = [0xFF, 0x02, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02,
0x02, 0x02, 0x01, 0x01, 0x01, 0x00, 0x01, 0x01,
0xC2, 0xC2, 0xC2, 0x00, 0x02, 0x00, 0x02, 0x02,
0x02, 0x02, 0x00, 0x01, 0x01, 0x00, 0x00, 0x02,
0x02, 0x02, 0x01, 0x01, 0x02, 0x01, 0x01, 0x82,
0x02, 0xC2, 0xC2, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x02, 0x02, 0x00, 0x02, 0x01, 0x00,
0x02, 0x02, 0x02, 0x02, 0x41, 0x00, 0x01, 0x01,
0x01, 0x00, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02,
0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02,
0x01, 0x00, 0xC2, 0x00, 0xC2, 0xC2, 0xC2, 0x00,
0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
0x02, 0x02, 0x02, 0x00, 0x00, 0x00, 0x02, 0x02,
0x02, 0x02, 0x00, 0x02, 0x02, 0x01, 0x02, 0x01,
0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01,
0xC2, 0xC0, 0x02, 0xC2, 0xC0, 0x00, 0x00, 0x02,
0xC0, 0xC0, 0x02, 0x00, 0x80, 0x02, 0x02, 0x02,
0x02, 0x02, 0x02, 0x02, 0x00, 0x01, 0x00, 0x82,
0x82, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02,
0x02, 0x01, 0x01, 0x01, 0x01, 0x02, 0x00, 0x00,
0x02, 0x02, 0x02, 0x02, 0x02, 0x01, 0x00, 0x02,
0x02, 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x00,
0x02, 0x00, 0x80, 0x80, 0x80, 0x80, 0x00, 0x00,
0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01,
0x00, 0x00, 0x80, 0x80, 0x00, 0x01, 0x80, 0x00,
0x01, 0x80, 0x02, 0x02, 0xC2, 0x42, 0x80, 0x80,
0x80, 0x01, 0x00, 0x02, 0x01, 0x01, 0x00, 0x00,
0x00, 0x00, 0x02, 0x02, 0x02, 0x02, 0x01, 0x00,
0x01, 0x02, 0x01, 0x02, 0x02, 0xC2, 0xC2, 0xC2,
0x02, 0x02, 0x02, 0x02, 0x02, 0xC2, 0x02, 0x02,
0x02, 0x02, 0x02, 0x02, 0x41, 0x02, 0x02, 0xFF,
0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF]

def dump_obj_level(rom, level, addr):
    # header
    snes_addr = addr
    addr = snes_to_pc(addr)
    start_addr = addr
    header = [ord(r) for r in rom[addr:addr + 10]]
    bg_color = header_value(header, 0, 5)
    bg1_tileset = header_value(header, 5, 4)
    bg1_palette = header_value(header, 9, 5)
    bg2_tileset = header_value(header, 14, 5)
    bg2_palette = header_value(header, 19, 6)
    bg3_tileset = header_value(header, 25, 6)
    bg3_palette = header_value(header, 31, 6)
    sprite_tileset = header_value(header, 37, 7)
    sprite_palette = header_value(header, 44, 4)
    level_mode = header_value(header, 48, 5)
    animation_tileset = header_value(header, 53, 6)
    animation_palette = header_value(header, 59, 5)
    bg_scroll = header_value(header, 64, 5)
    music = header_value(header, 69, 4)
    item_memory = header_value(header, 73, 2)
    unused = header_value(header, 75, 5)

#     print '${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\
# \t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}\t${:02X}'.format(
#         level, bg_color, bg1_tileset, bg1_palette, bg2_tileset, bg2_palette,
#         bg3_tileset, bg3_palette, sprite_tileset, sprite_palette, level_mode,
#         animation_tileset, animation_palette, bg_scroll, music, item_memory, unused
#         )

    # object
    addr += 10
    obj_ID = 0
    while obj_ID != 0xFF:
        obj_ID = ord(rom[addr])
        if obj_ID == 0xFF:
            break

        # 4 or 5 byte object?
        obj_size = 5
        bits_4_5 = level_obj_table[obj_ID] & 0x03
        if obj_ID == 0x00 or bits_4_5 == 0x00 or bits_4_5 == 0x01:
            obj_size = 4

        addr += obj_size

    # exit
    addr += 1
    if ord(rom[addr]) < 0x80:
        exit_ID = 0
        while exit_ID != 0xFF:
            exit_ID = ord(rom[addr])
            if exit_ID == 0xFF:
                break
            addr += 5

    addr += 1

    level_file = 'level-{:02X}-obj.bin'.format(level)
    size = addr - start_addr
    description = 'Level {:02X}: object data'.format(level)
    print '{:06X}'.format(snes_addr)
    print size
    print description
    with open(level_file, 'wb') as f:
        f.write(rom[start_addr:addr])

def dump_sprite_level(rom, level, addr):
    snes_addr = addr
    start_addr = addr = snes_to_pc(addr)

    spr_ID = [0x00, 0x00]
    while spr_ID != [0xFF, 0xFF]:
        # $FFFF == done
        spr_ID = [ord(b) for b in rom[addr:addr+2]]
        if spr_ID == [0xFF, 0xFF]:
            break
        addr += 3

    addr += 2
    level_file = 'level-{:02X}-spr.bin'.format(level)
    print '{:06X}'.format(snes_addr)
    print addr - start_addr
    print 'Level {:02X}: sprite data'.format(level)
    with open(level_file, 'wb') as f:
        f.write(rom[start_addr:addr])

rom = open_rom('yi.sfc')
# dump_bitmaps(rom)
# dump_gfx_files(rom, 'lz1', 'yi.sfc', 'lc_lz1.txt')
# dump_gfx_files(rom, 'lz16', 'yi.sfc', 'lc_lz16.txt')
# dump_obj_level(rom, 0x10, 0x00EBD4)
dump_levels(rom, 'level_obj.txt', 'level_sprite.txt')

with open('level_addrs.txt', 'r+') as f:
    for line in f.readlines():
        nums = line.split()
        print '  incbin level/level-{0}-{1}.bin             ; {2} |'.format(
            nums[0], nums[2], nums[1])
