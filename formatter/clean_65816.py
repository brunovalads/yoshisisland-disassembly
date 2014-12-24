import sys
import re

def clean_65816(filename):
    labels = set()
    output = []
    with open(filename, 'r') as f:
        for line in f:
            # cache regexes
            r_main = re.compile(r'\$(\w\w)/(\w\w\w\w)(?: \w\w\b)+\s+(.*);(.*)')
            r_br = re.compile(r'(B[^I]\w).*\[\$(\w\w\w\w).*')
            r_jmp = re.compile(r'(J\w[^L])\s+\$(\w\w\w\w).*')

            # are we a geiger line?
            m = r_main.match(line)
            if m:
                bank = m.group(1)
                address = m.group(2)
                instruction = m.group(3)
                comment = m.group(4)

                instruction = cleanse_brackets(
                    parse_br_jmp(instruction, bank, labels, r_br, r_jmp))

                output.append((bank + address, 
                    '    {0:20}; ${1}{2:6} |{3}'.format(
                    instruction.strip(), bank, address, comment)))
            else:
                output.append(('', line.strip()))

    # second pass for labels
    for (addr, line) in output:
        if addr in labels:
            print ''
            print 'CODE_{0}:'.format(addr)
        print line


def parse_br_jmp(instruction, bank, labels, r_br, r_jmp):
    """ detects all absolute branching/jumping, adds label & converts """
    m_br = r_br.match(instruction)
    m_jmp = r_jmp.match(instruction)
    m = m_br
    if m_br:
        m = m_br
    elif m_jmp:
        m = m_jmp
    else:
        return instruction

    label = '{0}{1}'.format(bank, m.group(2))
    labels.add(label)
    return '{0} CODE_{1}'.format(m.group(1), label)

def cleanse_brackets(instruction):
    """ gets rid of the [$xx:yyyy] shit """
    return re.sub(
        r'(.*)\[\$\w\w:\w\w\w\w\].*',
        r'\1',
        instruction)

clean_65816(sys.argv[1])