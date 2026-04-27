#############################################################################################################

# This script should be run just once on bank20.asm, to fix calls to SPC700 routines,
# so asar can build it correctly.

#############################################################################################################

import sys
import re

#############################################################################################################

# Regex pattern for jmp/call $XXXX
Labeled_jump_regex_pattern = re.compile(r"((jmp\s\s\s)|(call\s\s)|(JMP\s\s\s)|(CALL\s\s))CODE_([0-9a-fA-F]{4})")

Jump_address_offsets = {
    "0A96": "7FA8",
    "05FA": "7FA8",
    "1EDC": "8072",
    "04DA": "7FA8",
    "2137": "8072",
    "2066": "8072",
    "0754": "7FA8",
    "04EB": "7FA8",
    "0444": "7FA8",
    "0D46": "7FA8",
    "08B1": "7FA8",
    "0B1D": "7FA8",
    "0B35": "7FA8",
    "05F2": "7FA8",
    "0E57": "7FA8",
    "0B40": "7FA8",
    "075B": "7FA8",
    "0767": "7FA8",
    "090A": "7FA8",
    "0670": "7FA8",
    "06BB": "7FA8",
    "06D7": "7FA8",
    "06C3": "7FA8",
    "08A7": "7FA8",
    "0A2B": "7FA8",
    "0895": "7FA8",
    "0505": "7FA8",
    "0C67": "7FA8",
    "0AEC": "7FA8",
    "07CB": "7FA8",
    "0BAD": "7FA8",
    "08A9": "7FA8",
    "0C43": "7FA8",
    "0DCC": "7FA8",
    "0DD7": "7FA8",
    "0C60": "7FA8",
    "0C46": "7FA8",
    "0DB7": "7FA8",
    "056F": "7FA8",
    "0DBF": "7FA8",
    "0DA1": "7FA8",
    "0C02": "7FA8",
    "0D22": "7FA8",
    "0B52": "7FA8",
    "1FB8": "8072",
    "3E79": "6564",
    "3E5F": "6564",
    "3EBA": "6564",
    "20D8": "8072",
    "3E96": "6564",
    "2024": "8072",
    "3EA6": "6564",
    "2086": "8072",
    "209D": "8072",
    "221B": "8072",
    "2164": "8072",
    "2238": "8072",
    "21A8": "8072",
    "22A3": "8072",
    "3E20": "6564",
    "229A": "8072",
    "2236": "8072"
}

# Check each line in bank file, trying to find the jumps via regex match and labeling them
def process_bank_jumps(bank_asm_file_path):
    bank = bank_asm_file_path[-10:-4]
    print(f"\n> {bank}:")
    temporary_lines = []
    with open(bank_asm_file_path, 'r') as bank_asm_file:
        contents = bank_asm_file.read()
        lines = contents.split('\n')
        for line in lines:
            result = Labeled_jump_regex_pattern.search(line)
            edited_line = ""
            if result:
                jump_address = result.group(6)
                instruction = result.group(1).strip()
                #print(f"{instruction} ${jump_address} ({len(instruction)})") # DEBUG
                result_start = result.span()[0]
                result_end = result.span()[1]
                offset = Jump_address_offsets[jump_address.upper()]
                edited_line = f"{line[:result_end]}-${offset}{line[result_end+6:]}"
                new_label_addresses.add(jump_address)
                print(edited_line) # DEBUG
            else:
                edited_line = line
            temporary_lines.append(edited_line)
            #print(edited_line) # DEBUG
    return temporary_lines

# Actually write the edited bank asm file
def write_edited_bank_file(bank_asm_file_path, final_lines):
    debug = True
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
    final_lines = process_bank_jumps(bank_asm_file_path)
    final_lines_per_bank[bank_asm_file_path] = final_lines

# Finally, write the edited files
for bank_asm_file_path, final_lines in final_lines_per_bank.items():
    write_edited_bank_file(bank_asm_file_path, final_lines)

# Display detected addresses
new_label_addresses = list(new_label_addresses)
new_label_addresses.sort()
print("\nDetected addresses:")
print(list(map(lambda address: f"${address}", new_label_addresses)))