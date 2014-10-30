import sys
import re

def cum_all_over_me(filename, data_format, step):
    bytes = []
    addrs = []
    bank = '00'
    with open(filename, 'r') as f:     
        for line in f:
            r = re.compile(r'\$(\w\w)/(\S+) ((?:\w\w(?:[ ]|\b))+)')
            r_gsu = re.compile(r'\w\w(\w\w):(\S+) ((?:\w\w(?:[ ]|\b))+)')
            m = r.match(line)
            m_gsu = r_gsu.match(line)
            if m:
                bank = m.group(1)
                addrs.append(m.group(2))
                bytes.extend(m.group(3).strip().split())
            elif m_gsu:
                bank = m_gsu.group(1)
                addrs.append(m_gsu.group(2))
                bytes.extend(m_gsu.group(3).strip().split())

    # grab starting address
    start_addr = int(addrs[0], 16)
    addr = start_addr

    # default steps
    size_step = [1, 4]
    if data_format == 'db':
        size_step = [1, 4]
    elif data_format == 'dw':
        size_step = [2, 2]
    elif data_format == 'dl':
        size_step = [3, 3]
    elif data_format == 'dd':
        size_step = [4, 4]

    # overridden by command
    if step > 0:
        size_step[1] = step

    while addr < start_addr + len(bytes):
        i = addr - start_addr
        b = bytes[i:i + size_step[1]]

        # test remainder
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

def contains(small, big):
    """tests whether one list contains the contents of another"""
    for i in xrange(len(big)-len(small)+1):
        for j in xrange(len(small)):
            if big[i+j] != small[j]:
                break
        else:
            return i, i+len(small)
    return False

def one_line(bank, addr, data_format, size, bytes):
    """prints a full line of bytes"""
    line = 'DATA_{0}{1}:{2:>9}{3} {4}'.format(bank, format(addr, '04X'), ' ', data_format, shit_in_my_ass(size, bytes))
    print line

def shit_in_my_ass(size, bytes):
    """builds up data string"""
    chunks = ['$' + ''.join([bytes[i + j] for j in reversed(xrange(size))]) for i in xrange(0, len(bytes), size)]
    return ', '.join(chunks)


data_format = 'db'
step = 0
break_on = []
data_formats = ['db', 'dw', 'dl', 'dd']
if len(sys.argv) >= 3:
    if sys.argv[2] in data_formats:
        data_format = sys.argv[2]

if len(sys.argv) >= 4:
    try:
        step = int(sys.argv[3])
    except:
        print('Please enter a numerical step value (in bytes).')
        sys.exit(1)

cum_all_over_me(sys.argv[1], data_format, step)
