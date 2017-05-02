# dumps a Yoshi's Island level to .bin file
# pass in hex index as a cmd arg
# also optionally gives a report of sprite types found
# and other information

from romutils import open_rom, snes_dickbutt_to_pc, get_int
import sys

def dump_levels(rom, report):
    for level in range(0, 0xDE):
        dump_level(rom, level, report)

def dump_level(rom, level, report):
    # grab level pointers and dump each level
    obj_addr = get_int(rom, 0x17F7C3 + level * 6, 3)
    sprite_addr = get_int(rom, 0x17F7C6 + level * 6, 3)
    obj_reds = dump_obj_level(rom, level, obj_addr, report)
    dump_sprite_level(rom, level, sprite_addr, report, obj_reds)

def header_value(header, start, length):
    local_index = 0
    header_val = 0x00
    for total_index in range(start, start + length):
        byte_index = total_index // 8
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

def dump_obj_level(rom, level, addr, report):
    reds = 0
    # header
    snes_addr = addr
    addr = snes_dickbutt_to_pc(addr)
    start_addr = addr
    header = [r for r in rom[addr:addr + 10]]
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
        obj_ID = rom[addr]
        ext_ID = rom[addr+3]
        if obj_ID == 0xFF:
            break

        # 4 or 5 byte object?
        obj_size = 5
        bits_4_5 = level_obj_table[obj_ID] & 0x03
        if obj_ID == 0x00 or bits_4_5 == 0x00 or bits_4_5 == 0x01:
            obj_size = 4

        # red coin check
        if obj_ID == 0x00 and ext_ID == 0x16:
            reds += 1

        addr += obj_size

    # exit
    addr += 1
    if rom[addr] < 0x80:
        exit_ID = 0
        while exit_ID != 0xFF:
            exit_ID = rom[addr]
            if exit_ID == 0xFF:
                break
            addr += 5

    addr += 1

    if report:
        print('Level {:02X} object data, address {:06X}, size {:02X}'.format(
            level, snes_addr, addr - start_addr))
    else:
        level_file = 'level-{:02X}-obj.bin'.format(level)
        with open(level_file, 'wb') as f:
            f.write(rom[start_addr:addr])

    return reds

def dump_sprite_level(rom, level, addr, report, obj_reds):
    snes_addr = addr
    start_addr = addr = snes_dickbutt_to_pc(addr)
    sprite_counts = [0] * 0x200
    reds = obj_reds
    flowers = 0
    mid_ring = None

    spr_ID = [0x00, 0x00]
    while spr_ID != [0xFF, 0xFF]:
        # $FFFF == done
        spr_ID = [b for b in rom[addr:addr+2]]
        if spr_ID == [0xFF, 0xFF]:
            break
        sprite_high = (spr_ID[1] & 0x01) << 8
        sprite_full = sprite_high | spr_ID[0]
        sprite_X = rom[addr+2]
        sprite_Y = (rom[addr+1] & 0xFE) >> 1
        sprite_XY = [sprite_X % 2, sprite_Y % 2]

        sprite_counts[sprite_full] += 1

        # test flower
        flower_IDs = [0xB8, 0xFA, 0x110]
        if sprite_full in flower_IDs or \
            sprite_full == 0x67 and sprite_XY == [1, 0] or \
            sprite_full == 0x161 and sprite_XY == [0, 1]:

            flowers += 1

        # test red coin
        red_IDs = [0x22, 0x65, 0x68]
        if sprite_full in red_IDs or \
            sprite_full == 0x8D and sprite_XY == [1, 0] or \
            sprite_full == 0x12C and sprite_XY[0] == 0 or \
            sprite_full == 0x161 and sprite_XY == [0, 0]:

            reds += 1

        # test middle rings
        if sprite_full == 0x4F:
            mid_ring = (sprite_X, sprite_Y)

        addr += 3

    addr += 2
    level_file = 'level-{:02X}-spr.bin'.format(level)

    if report:
        print('Level {:02X} sprite data, address {:06X}, size {:02X}'.format(
            level, snes_addr, addr - start_addr))
        sprites = ['{0:03X}: {1}'.format(x, sprite_counts[x]) for x in range(0, len(sprite_counts)) if sprite_counts[x] > 0]
        # for s in sprites:
        #     print s
        print('{0} flowers found, {1} red coins found'.format(flowers, reds))
        if mid_ring is not None:
            print('Midring coordinates: {:02X}, {:02X}'.format(mid_ring[0], mid_ring[1]))
        print("")
    else:
        with open(level_file, 'wb') as f:
            f.write(rom[start_addr:addr])

if __name__ == '__main__':
    if len(sys.argv) <= 1:
        print('Usage: python dump_levels.py romname [-r]')
        sys.exit()
    rom = open_rom(sys.argv[1])
    report = len(sys.argv) > 2 and sys.argv[2] == '-r'
    dump_levels(rom, report)
