#############################################################################################################

# This script should be run with a text file containing the pasted data from Mesen SPC debugger (by selecting the disassembled lines and copying).
# For example:
# 3E7A  8D 5C          MOV Y,#$5C
# becomes
#   MOV   Y,#$5C                            ; $3E7A |

#############################################################################################################

import sys
import re

#############################################################################################################

def parse_mensen_output(filename):
    print("")
    with open(filename, 'r') as file:
        contents = file.read()
        lines = contents.split('\n')
        for line in lines:
            if "----" in line:
                print(line)
                continue
            elif line == "":
                print(line)
            else:
                address = line[:4]
                instruction = line[21:]
                instruction_elements = instruction.split(" ")
                opcode = instruction_elements.pop(0)
                instruction_spaces = " "*(6 - len(opcode))
                arguments = " ".join(instruction_elements).replace("!$", "$")
                instruction = f"{opcode}{instruction_spaces}{arguments}"
                address_alignment_spaces = " "*(42 - len(instruction))
                print(f"  {instruction}{address_alignment_spaces}; ${address} |")
    

#############################################################################################################

if len(sys.argv) != 2:
    print ('Usage: mesen_spc_debugger_formatter.py dumpFileName')
    sys.exit()
    
parse_mensen_output(sys.argv[1])