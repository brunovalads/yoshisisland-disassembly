import sys

def remove_annoying_shit(filename):
    with open(filename, 'r') as file:
        for line in file:
            l = line
            i = line.find('A:')
            if i >= 0:
                l = line[0:i] + ';\n'
            sys.stdout.write(l)

remove_annoying_shit(sys.argv[1])