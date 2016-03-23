import sys
import re

#CODE_0541: or    ($5e),($47)       ; set volume changed flg
def clean_spc(filename):
    # cache regexes
    r_main = re.compile(r'(?:CODE_|DATA_)(\w\w\w\w): (.+);(.*)')
    r_nocm = re.compile(r'(?:CODE_|DATA_)(\w\w\w\w): (.+)')
    r_addr = re.compile(r'CODE_(\w\w\w\w)')

    labels = set()
    output = []
    with open(filename, 'r') as f:
        for line in f:
            comment = ''

            m = r_main.match(line)
            m_n = r_nocm.match(line)

            # parse comment if any
            if m:
                comment = m.group(3)
            elif m_n:
                m = m_n
            else:
                output.append(('', line.rstrip()))
                continue

            # detect labels if any
            instruction = m.group(2)
            m_label = r_addr.search(instruction)
            if m_label:
                labels.add(m_label.group(1))

            append_line(m.group(1), instruction, comment, output)

    # second pass for labels
    for (addr, line) in output:
        if addr in labels:
            print ''
            print 'CODE_{0}:'.format(addr)
        print line

def append_line(address, instruction, comment, output):
    output.append((address,
        '  {0:42}; ${1:4} |{2}'.format(
        instruction.strip(), address, comment)))

clean_spc(sys.argv[1])
