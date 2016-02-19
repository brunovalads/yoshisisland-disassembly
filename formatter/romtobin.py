# this script requires gfx/ folder to be present
# and yi.sfc as a clean YI ROM

def snes_to_pc(addr):
    bank = (addr & 0xFF0000) >> 16
    absolute = (addr & 0x00FFFF)
    abs_corrected = absolute - 0x8000 * (1 - bank % 2)
    return (bank << 15) | abs_corrected

def dickbutt_to_pc(addr):
    return addr - 0x400000

def open_rom(file):
    with open(file, 'rb') as f:
        return f.read()

def slice_of_rom(rom, addr, length):
    addr = snes_to_pc(addr)
    return rom[addr:addr+length]

def parse_addrs(file):
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

def dump_gfx_files(compression, romfile, txt):
    rom = open_rom(romfile)
    addrs = parse_addrs(txt)
    with open('gfx/' + compression + '.asm', 'w') as incbin:
        for addr_info in addrs:
            addr = snes_to_pc(addr_info[0])
            content = rom[addr:addr + addr_info[1]]
            dump_gfx_file(content, compression, addr_info, incbin)

dump_gfx_files('lz1', 'yi.sfc', 'lc_lz1.txt')
dump_gfx_files('lz16', 'yi.sfc', 'lc_lz16.txt')
