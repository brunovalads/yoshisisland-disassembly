import sys
import re

def clean_gsu(filename):
    with open(filename, 'r') as f:
        for line in f:
            r = re.compile(r'\w\w(\w\w):(\w\w\w\w) ((?:[0-9a-fA-F][0-9a-fA-F](?:\+)?[ ])+)(.*)')
            m = r.match(line)
            if m:
                bank = m.group(1)
                addr = m.group(2)
                gbytes = m.group(3).strip().replace('+', '').split()
                the_rest = m.group(4).strip()

                if not the_rest.strip().startswith('move'):
                    for b in gbytes:
                        if b[0] == '1':
                            print output_instr(bank, addr, r_instr('to', b[1]))
                            addr = increment_addr(addr, 1)
                        elif b[0] == '2':
                            print output_instr(bank, addr, r_instr('with', b[1]))
                            addr = increment_addr(addr, 1)
                        elif b[0] == 'B':
                            print output_instr(bank, addr, r_instr('from', b[1]))
                            addr = increment_addr(addr, 1)
                        # elif b == '3D':
                        #     print output_instr(bank, addr, 'alt1')
                        #     addr = increment_addr(addr, 1)
                        # elif b == '3E':
                        #     print output_instr(bank, addr, 'alt2')
                        #     addr = increment_addr(addr, 1)
                        # elif b == '3F':
                        #     print output_instr(bank, addr, 'alt3')
                        #     addr = increment_addr(addr, 1)
                        else:
                            # if no alt/with/to/from, stop parsing
                            break

                # branching
                the_rest = re.sub(
                    r'(bra|bge|blt|bne|beq|bpl|bmi|bcc|bcs|bvc|bvs)\s+(\w+)',
                    '\\1 CODE_{0}\\2'.format(bank),
                    the_rest)

                # labeling
                the_rest = output_instr(bank, addr, the_rest)

                print the_rest
            else:
                print line.strip()

def output_instr(bank, addr, instr):
    return label_instr(bank, addr, comment_instr(instr))

def comment_instr(instr):
    r_comm = re.compile(r'(.*)(;)(.*)')
    m_comm = r_comm.match(instr)
    pre_post_comm = ['', '']
    if m_comm:
        pre_post_comm[0] = m_comm.group(1)
        pre_post_comm[1] = m_comm.group(3)
    else:
        pre_post_comm[0] = instr
    return '{0:20};{1}'.format(pre_post_comm[0], pre_post_comm[1])

def label_instr(bank, addr, instr):
    return 'CODE_{0}{1}:         {2}'.format(bank, addr, instr)

def r_instr(instr, nib):
    """takes a nibble & instruction, spits out proper GSU register formatting"""
    return '{0} r{1}'.format(instr, int(nib, 16))

def increment_addr(addr, inc):
    """takes the old address and spits out a hex string of the incremented"""
    return '{:02X}'.format(int(addr, 16) + inc)

clean_gsu(sys.argv[1])