#############################################################################################################

# This script should be run just once on bank20.asm, to check jumps and calls to unlabeled SPC700 routines.
# So, a jmp/call $XXXX should be jmp/call CODE_XXXXXX.
# Of course this script is an adaptation of long_jump_labeler.py

#############################################################################################################

import sys
import glob
import re

#############################################################################################################

# Regex pattern for jmp/call $XXXX
Unlabeled_jump_regex_pattern = re.compile(r"((jmp\s\s)|(jmp\s\s\s)|(call\s\s))\$([0-9a-fA-F]{4})")

# Check each line in bank file, trying to find the jumps via regex match and labeling them
def process_bank_jumps(bank_asm_file_path):
    bank = bank_asm_file_path[-10:-4]
    print(f"\n> {bank}:")
    temporary_lines = []
    with open(bank_asm_file_path, 'r') as bank_asm_file:
        contents = bank_asm_file.read()
        lines = contents.split('\n')
        for line in lines:
            result = Unlabeled_jump_regex_pattern.search(line)
            edited_line = ""
            if result:
                jump_address = result.group(5)
                instruction = result.group(1).strip()
                #print(f"{instruction} ${jump_address} ({len(instruction)})") # DEBUG
                result_start = result.span()[0]
                result_end = result.span()[1]
                instruction_spacing = " "*(instruction == "jmp" and 3 or 2)
                edited_line = f"{line[:result_start]}{instruction}{instruction_spacing}CODE_{jump_address}"
                edited_line += line[len(edited_line):]
                new_label_addresses.add(jump_address)
            else:
                edited_line = line
            temporary_lines.append(edited_line)
            #print(edited_line) # DEBUG
    return temporary_lines

# Check each line in bank file, inserting the CODE_XXXXXX labels according to the ones found in all banks files previously
def process_bank_routines(temporary_lines, new_label_addresses):
    final_lines = []
    previous_line = None
    for temporary_line in temporary_lines:
        edited_line = temporary_line + ""
        result = re.search(r".+;\s\$([0-9A-Fa-f]{4})\s\|", temporary_line)
        if result:
            address = result.group(1)
            
            if address in new_label_addresses:
                print(address) # DEBUG
                if not previous_line.strip().startswith((";", "CODE_")) and len(previous_line.strip()) > 0:
                    #final_lines.append("")
                    final_lines.append("")
                if not previous_line.strip().startswith(f"CODE_{address}:"):
                    final_lines.append(f"CODE_{address}:")
        final_lines.append(edited_line)
        previous_line = edited_line
        #print(edited_line) # DEBUG
    return final_lines

# Actually write the edited bank asm file
def write_edited_bank_file(bank_asm_file_path, final_lines):
    debug = False
    if debug:
        bank_asm_file_path = bank_asm_file_path.replace(".asm", "_NEW.asm")
    with open(bank_asm_file_path, "w") as bank_asm_file:
        for final_line in final_lines:
            bank_asm_file.write(f"{final_line}\n")
    
#############################################################################################################

# Dictionary holding each bank file name and its respective lines
final_lines_per_bank = dict()

# Set of addresses that were detected, to use in the second pass to actually label the routines
new_label_addresses = set()

# Get all the bank asm files in the "disassembly" folder in this repository
bank_asm_file_paths = ["../disassembly/bank20.asm"]

# First pass of banks, to detect the jumps
for bank_asm_file_path in bank_asm_file_paths:
    temporary_lines = process_bank_jumps(bank_asm_file_path)
    final_lines_per_bank[bank_asm_file_path] = temporary_lines

# Second pass of banks, to label the routines
for bank_asm_file_path, temporary_lines in final_lines_per_bank.items():
    final_lines = process_bank_routines(temporary_lines, new_label_addresses)
    final_lines_per_bank[bank_asm_file_path] = final_lines

# Finally, write the edited files
for bank_asm_file_path, final_lines in final_lines_per_bank.items():
    write_edited_bank_file(bank_asm_file_path, final_lines)

# Display detected addresses
new_label_addresses = list(new_label_addresses)
new_label_addresses.sort()
print("\nDetected addresses:")
print(list(map(lambda address: f"${address}", new_label_addresses)))