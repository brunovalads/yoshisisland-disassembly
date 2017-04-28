# useful little functions for reading parts of a Yoshi's Island ROM
import struct

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

# handles either with an if
def snes_dickbutt_to_pc(addr):
    return dickbutt_to_pc(addr)\
        if addr >= 0x400000\
        else snes_to_pc(addr)

def dickbutt_to_snes(addr):
    return pc_to_snes(dickbutt_to_pc(addr))

def open_rom(file):
    with open(file, 'rb') as f:
        data = f.read()
        # chop off header if present
        if len(data) > 0x200000:
            return data[0x200:]
        return data

def slice_of_rom(rom, addr, length):
    addr = snes_dickbutt_to_pc(addr)
    return rom[addr:addr+length]

# grabs any-sized integer from ROM, treats as little endian
def get_int(rom, addr, size):
    pointer_str = slice_of_rom(rom, addr, size) + b'\x00' * (4 - size)
    return struct.unpack('i', pointer_str)[0]

# stores any-sized integer into ROM at address, returns full ROM
# size is bytes
def store_int(rom, addr, size, num):
    addr = snes_dickbutt_to_pc(addr)
    str_data = struct.pack('i', num)
    rom = rom[:addr] + str_data[0:size] + rom[addr+size:]
    return rom
