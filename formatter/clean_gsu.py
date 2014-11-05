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
                        print output_instr(bank, addr, r_instr('to', b[1]))
                    elif b[0] == '2':
                        print output_instr(bank, addr, r_instr('with', b[1]))
                    elif b[0] == 'B':
                        print output_instr(bank, addr, r_instr('from', b[1]))
                    elif b == '3D':
                        print output_instr(bank, addr, 'alt1')
                    elif b == '3E':
                        print output_instr(bank, addr, 'alt2')
                    elif b == '3F':
                        print output_instr(bank, addr, 'alt3')
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
    r_comm = re.compile(r'(.*)(\s+)(;)(.*)')
    m_comm = r_comm.match(instr)
    if m_comm:
        com_len = 19 - len(m_comm.group(1))
        com_spaces = ' ' * com_len
        instr = m_comm.expand(r'\1{0}\3\4').format(com_spaces)
    else:
        com_len = 19 - len(instr)
        instr += ' ' * com_len + ';'
    return instr

def label_instr(bank, addr, instr):
    return 'CODE_{0}{1}:         {2}'.format(bank, addr, instr)

def r_instr(instr, nib):
    """takes a nibble & instruction, spits out proper GSU register formatting"""
    return '{0} r{1}'.format(instr, int(nib, 16))

clean_gsu(sys.argv[1])