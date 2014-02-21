import sys
import re
import itertools

def cum_all_over_me(filename, data_format):
    bytes = []
    addrs = []
    bank = '$00/'
    with open(filename, 'r') as f:     
        for line in f:
            r = re.compile(r'(\$\w\w/)(\S+) ((?:\w\w(?:[ ]|\b))+)')
            m = r.match(line)
            if m:
                bank = m.group(1)
                addrs.append(m.group(2))
                bytes.extend(m.group(3).strip().split())

    # grab starting address
    addr = int(addrs[0], 16)

    size_step = [1, 4]
    if data_format == 'db':
        size_step = [1, 4]
    elif data_format == 'dw':
        size_step = [2, 4]
    elif data_format == 'dl':
        size_step = [3, 6]

    for i in xrange(0, len(bytes), size_step[1]):
        b = bytes[i:i + size_step[1]]
        if len(b) < size_step[1] and len(b) % size_step[0] != 0:
            if len(b) - size_step[0] > 0:
                # there is poop left in the butthole
                poop = b[0:len(b) - (len(b) % size_step[0])]
                one_line(bank, addr, data_format, size_step[0], poop)
                addr += len(poop)
                del b[0:len(b) - (len(b) % size_step[0])]

            # change size to 1 for remainder!!!!
            size_step[0] = 1
            data_format = 'db'

        one_line(bank, addr, data_format, size_step[0], b)
        addr += size_step[1]

# prints a full line of bytes
def one_line(bank, addr, data_format, size, bytes):
    line = '{0}{1}{2:>13}.{3} {4}'.format(bank, format(addr, '04X'), ' ', data_format, shit_in_my_ass(size, bytes))
    print line

# builds up data string
def shit_in_my_ass(size, bytes):
    chunks = ['$' + ''.join([bytes[i + j] for j in reversed(xrange(size))]) for i in xrange(0, len(bytes), size)]
    return ', '.join(chunks)


data_format = 'db'
data_formats = ['db', 'dw', 'dl']
if len(sys.argv) >= 3:
    if sys.argv[2] in data_formats:
        data_format = sys.argv[2]

cum_all_over_me(sys.argv[1], data_format)

