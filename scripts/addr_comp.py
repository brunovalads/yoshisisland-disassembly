# computes addresses starting at start address
# and ending at end address with arbitrary # of step values
# which are used to increment the address by that much
# each time, with wraparound
import sys

def compute_addresses(begin_addr, end_addr, steps):
    step_sum = sum(steps)

    # convert steps to absolute offsets
    for step_index in range(1, len(steps)):
        steps[step_index] += steps[step_index - 1]
    # clip off last, add 0 to beginning
    steps = [0] + steps[0:len(steps)-1]

    for addr in range(begin_addr, end_addr, step_sum):
        for step in steps:
            print('; ${:06X} |'.format(addr+step))

try:
    begin_addr = int(sys.argv[1], 16)
    end_addr = int(sys.argv[2], 16)
    step_values = [int(step) for step in sys.argv[3:]]
    compute_addresses(begin_addr, end_addr, step_values)
except (IndexError, ValueError):
    print("Usage: python addr_comp.py <start address (hex)> <end address (hex)> <step 1> <step 2> <step 3> ...")
