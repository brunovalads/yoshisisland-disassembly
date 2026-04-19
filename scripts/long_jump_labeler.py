#############################################################################################################

# This script should be run just once, to check long jumps to unlabeled routines.
# So, a JML/JSL $XXXXXX should be JML/JSL CODE_XXXXXX.

#############################################################################################################

import sys
import glob
import re

#############################################################################################################

# Regex pattern for JML/JSL $XXXXXX
# Avoid banks greater then $3F because there are JML/JSL $7EXXXX
Unlabeled_jump_regex_pattern = re.compile(r"(JSL|JML)\s\$([0-3][0-9A-Fa-f]{5})")

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
                jump_address = result.group(2)
                result_start = result.span()[0]
                result_end = result.span()[1]
                edited_line = f"{line[:result_start]}{line[result_start:result_start+3]} CODE_{jump_address}{line[result_end+4:]}"
                new_label_addresses.add(jump_address)
            else:
                edited_line = line
            temporary_lines.append(edited_line)
            #print(edited_line)
    return temporary_lines

# Check each line in bank file, inserting the CODE_XXXXXX labels according to the ones found in all banks files previously
def process_bank_routines(temporary_lines, new_label_addresses):
    final_lines = []
    previous_line = None
    for temporary_line in temporary_lines:
        edited_line = temporary_line + ""
        result = re.search(r".+;\s\$([0-9A-Fa-f]{6})\s\|", temporary_line)
        if result:
            address = result.group(1)
            if address in new_label_addresses:
                if previous_line.strip().startswith(("; l sub", "; long sub")):
                    final_lines.pop()
                elif not previous_line.strip().startswith((";", "CODE_")) and len(previous_line.strip()) > 0:
                    final_lines.append("")
                if not previous_line.strip().startswith(f"CODE_{address}:"):
                    final_lines.append(f"CODE_{address}:")
        if temporary_line.strip().endswith(" | entry point"):
            edited_line = edited_line.replace(" | entry point", " |", 1)
        elif temporary_line.strip().endswith(" | entry point here"):
            edited_line = edited_line.replace(" | entry point here", " |", 1)
        elif temporary_line.strip().endswith(" | -- entry point"):
            edited_line = edited_line.replace(" | -- entry point", " |", 1)
        final_lines.append(edited_line)
        previous_line = edited_line
    return final_lines

# Actually write the edited bank asm file
def write_edited_bank_file(bank_asm_file_path, final_lines):
    """
    # Debug before actually overwriting the files
    DEBUG_PATH = "E:/Python/YI_DIS"
    new_bank_asm_file_path = f"{DEBUG_PATH}/{bank_asm_file_path[-10:-4]}_NEW.asm"
    print(f"new_bank_asm_file_path: {new_bank_asm_file_path}")
    with open(new_bank_asm_file_path, "w") as new_bank_asm_file:
    """
    with open(bank_asm_file_path, "w") as new_bank_asm_file:
        for final_line in final_lines:
            new_bank_asm_file.write(f"{final_line}\n")
    
#############################################################################################################

# Dictionary holding each bank file name and its respective lines
final_lines_per_bank = dict()

# Set of addresses that were detected, to use in the second pass to actually label the routines
new_label_addresses = set()

# Get all the bank asm files in the "disassembly" folder in this repository
bank_asm_file_paths = [file for file in glob.glob("../disassembly/*.asm") if "\\bank" in file]

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