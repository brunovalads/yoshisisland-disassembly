import sys
import re

def clean_gsu(filename):
    with open(filename, 'r') as f:
        for line in f:
            r = re.compile(r'\w\w(\w\w):(\w\w\w\w) ((?:\w\w[ ])+)\s+(.*)')
            m = r.match(line)
            if m:
                bank = m.group(1)
                addr = m.group(2)
                gbytes = m.group(3).strip().split()
                the_rest = m.group(4)

                for b in gbytes:
                    if b[0] == '1':
                        print r_instr('to', b[1])
                    elif b[0] == '2':
                        print r_instr('with', b[1])
                    elif b[0] == 'B':
                        print r_instr('from', b[1])
                    elif b == '3D':
                        print 'alt1'
                    elif b == '3E':
                        print 'alt2'
                    elif b == '3F':
                        print 'alt3'
                    else:
                        # if no alt/with/to/from, stop parsing
                        break

                print the_rest
            else:
                print line.strip()

def r_instr(instr, nib):
    """takes a nibble & instruction, spits out proper GSU register formatting"""
    return '{0} r{1}'.format(instr, int(nib, 16))

clean_gsu(sys.argv[1])