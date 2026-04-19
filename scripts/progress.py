import sys
import glob
import re

def calculate_progress(verbose):
    bank_asm_files = [file for file in glob.glob("../disassembly/*.asm") if "\\bank" in file]
    #print(bank_asm_files)
    
    done_banks = []
    
    comments = 0
    total = 0
    bank_totals = {}
    for bank_asm_file in bank_asm_files:
        bank = bank_asm_file[-10:-4]
        with open(bank_asm_file, 'r') as f:
            bank_comments = 0
            bank_total = 0
            
            contents = f.read()
            lines = filter(None, contents.split('\n'))
            for line in lines:
                clean_line = line.strip()
                
                # Skip empty lines
                if len(clean_line) <= 0:
                    continue
                    
                # Skip asar build things
                if clean_line.startswith(("org ", "incbin ", "fillbyte ", "arch ", "lorom")):
                    continue
                    
                # Skip comment lines
                if clean_line.startswith(";"):
                    continue
                
                # Consider a code as document if it has more to the right of "; $XXXXXX |"
                if re.search(r";\s\$([0-9A-Fa-f]{6})\s\|", clean_line) and not re.search(r";\s\$([0-9A-Fa-f]{6})\s\|\s*$", clean_line):
                    bank_comments += 1
                
                # Consider data line as documented
                # TODO: Should not, instead it should detect contiguous data lines and check if there was a label or comment (excluding "unknown") right before the contiguous block
                elif clean_line.startswith(("db ", "dw ", "dl ")):
                    bank_comments += 1
                
                bank_total += 1
            
            if bank_comments == bank_total:
                done_banks.append(bank)
                
            if verbose:
                output_bank(bank, bank_comments, bank_total)
            
            comments += bank_comments
            total += bank_total

    percent = total > 0 and float(comments) / float(total) * 100.0 or 100.0
    print('')
    print('Total:')
    print('Done lines: {0}'.format(comments))
    print('Total lines: {0}'.format(total))
    print('Progress: {0:.2f}%'.format(percent))
    print('{0}/{1} banks done'.format(len(done_banks), len(bank_asm_files)))

def output_bank(bank, comments, total):
    percent = total > 0 and float(comments) / float(total) * 100.0 or 100.0
    print('{0}: {1:<5} /  {2:<5} = {3:>6.2f}%'.format(bank, comments, total, percent))

verbose = len(sys.argv) > 1 and sys.argv[1] == '-v'
calculate_progress(verbose)