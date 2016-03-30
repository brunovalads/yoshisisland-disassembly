import sys
import re

def report_bad_labels(filename):
    labels = set()
    r_label = re.compile(r'\s*(CODE_\w+):.*')
    with open(filename, 'r') as f:
        for line in f:
            m = r_label.match(line)
            if m:
                labels.add(m.group(1))

    r = re.compile(r'.+(CODE_\w+)[^:].+')
    with open(filename, 'r') as f:
        for line in f:
            m = r.match(line)
            if m and m.group(1) not in labels:
                print line[0:len(line) - 1]

report_bad_labels(sys.argv[1])