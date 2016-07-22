import re

def open_rom(file):
    with open(file, 'rb') as f:
        return f.read()

def snes_to_pc(addr):
    bank = (addr & 0xFF0000) >> 16
    absolute = (addr & 0x00FFFF)
    abs_corrected = absolute - 0x8000 * (1 - bank % 2)
    return (bank << 15) | abs_corrected

def count_opcodes(rom, filename):
    r_instruction = re.compile(r'\s*[A-Z]{3}\s+.*;\s+\$(\w{6}).*')

    counts = [0] * 256

    with open(filename, 'r') as f:
        for line in f:
            m = r_instruction.match(line)

            if m:
                addr = int(m.group(1), 16)
                op_byte = ord(rom[snes_to_pc(addr)])
                counts[op_byte] += 1
                #print m.group(1), '{:02X}'.format())

    for i in range(len(counts)):
        print '{0:02X}: {1}'.format(i, counts[i])

rom = open_rom('yi.sfc')
count_opcodes(rom, 'full.log')
