import sys

def add_comment_lines(filename):
    with open(filename, 'r') as file:
        for line in file:
            l = line[0:len(line) - 1]
            comment_line = 41
            if ';' not in l and len(l) > 0 and len(l) < comment_line:
                spaces = ' ' * (comment_line - len(l))
                l = l + spaces + ';'

            sys.stdout.write(l + '\n')

add_comment_lines(sys.argv[1])