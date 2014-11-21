import sys
import re

def clean_spc(filename):
	spc_addr = []
	bytes = []
	ins_shit = []
	snes_start = '2083A8'
	with open(filename, 'r') as f:
		for line in f:
			r = re.compile(r'(\w\w\w\w): (\w\w[ ][^\$](?:\w|[ ])(?:\w|[ ])(?:\w|[ ])(?:\w|[ ])[ ][ ])(.*)$')
			m = r.match(line)
			if m:
				# spc address, NOT SNES ADDRESS
				spc_addr.append(m.group(1))
				# throws each line of bytes into its own index
				bytes.extend(m.group(2).strip().split("\n"))
				# instructions and arguments
				ins_shit.extend(m.group(3).strip().split("\n"))

	# get spc start address
	#spc_start = int(spc_addr[0], 16)
	snes_addr = int(snes_start, 16)

	while snes_addr <= 2133579:
		size = get_size(bytes)
		# if bytes[0][0] == "db $" or "dw $":
		# 	flip_over(snes_addr, bytes[0])
		# 	del bytes[0]
		# else:
		dj_spin_that_shit(snes_addr, ins_shit[0])
		del bytes[0]
		del ins_shit[0]
		snes_addr += size

def get_size(bytes):
	# bytes per line
	size_line = 0
	if len(bytes[0]) == 2:
		size_line = 1
	elif len(bytes[0]) == 5:
		size_line = 2
	elif len(bytes[0]) == 8:
		size_line = 3
	elif len(bytes[0]) == 10:
		size_line = 2
	elif len(bytes[0]) == 14:
		size_line = 3
	elif len(bytes[0]) == 18:
		size_line = 4
	elif len(bytes[0]) == 22:
		size_line = 5
	elif len(bytes[0]) == 26:
		size_line = 6
	elif len(bytes[0]) == 30:
		size_line = 7
	elif len(bytes[0]) == 34:
		size_line = 8
	elif len(bytes[0]) == 38:
		size_line = 9
	elif len(bytes[0]) == 42:
		size_line = 10
	elif len(bytes[0]) == 46:
		size_line = 11

	return size_line

	#print(spc_start)
	#spc_start += size_line
	#print(spc_start)

	# debug
	#b = bytes[1]
	# del bytes[1]
	# d = bytes[1]
	# print(ins_shit[1])
	# dj_spin_that_shit(snes_addr, ins_shit[0])
	# snes_addr += size_line
	# del ins_shit[0]
	# dj_spin_that_shit(snes_addr, ins_shit[0])
	# print(b)
	# print(line_size[1])

def flip_over(addr, bytes):
	line = 'DATA_{0:X}: {1}'.format(addr, bytes)
	print(line)

def dj_spin_that_shit(addr, ins):
	# prints a line
	line = 'CODE_{0:X}:         {1}'.format(addr, ins)
	print(line)

clean_spc(sys.argv[1])