import sys

def cum_all_over_me(filename, data_format):
    bytes = []
    addrs = []
    bank = '$00/'
    with open(filename, 'r') as f:     
        for line in f:
            l = line.split()
            addrs.append(l[0][4:8])
            bank = l[0][0:4]
            # remove address
            del l[0]

            for s in l:
                # end of bytes
                if len(s) > 2:
                    break
                bytes.append(s)

    # grab starting address
    addr = int(addrs[0], 16)
    for i in xrange(0, len(bytes), 4):
        b = bytes[i:i+4]
        line = '{0}{1}{2:>13}.{3} {4}'.format(bank, format(addr, '04X'), ' ', data_format, shit_in_my_ass(data_format, b))
        print line
        addr += 4

# builds up data string
def shit_in_my_ass(data_format, bytes):
    chunks = []
    if data_format == 'db':
        chunks = ['${0}'.format(b) for b in bytes]
    elif data_format == 'dw':
        chunks = ['${1}{0}'.format(bytes[i], bytes[i + 1]) for i in xrange(0, len(bytes), 2)]
    return ', '.join(chunks)


data_format = 'db'
data_formats = ['db', 'dw']
if len(sys.argv) >= 3:
    if sys.argv[2] in data_formats:
        data_format = sys.argv[2]

cum_all_over_me(sys.argv[1], data_format)

