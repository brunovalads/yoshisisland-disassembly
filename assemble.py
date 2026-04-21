import os
import subprocess
import hashlib
import sys
from scripts.romutils import pc_to_snes

#############################################################################################################
# Configuration

BASE_DIR = os.path.dirname(os.path.abspath(__file__))
ROM_BASE_NAME = "yi"
ROM_NAME = f"{ROM_BASE_NAME}.sfc"
ASAR_RELATIVE_PATH = "asar\\asar.exe"
ASSEMBLE_RELATIVE_PATH = "disassembly\\assemble.asm"
HASH_MD5 = "yi.md5sum"
HASH_SHA1 = "yi.sha1sum"
HASH_SHA256 = "yi.sha256sum"

#############################################################################################################
# Functions

def build_rom():
    print(f'Building "{ROM_NAME}"...\n')
    
    asar_path = os.path.join(BASE_DIR, ASAR_RELATIVE_PATH)
    assemble_path = os.path.join(BASE_DIR, ASSEMBLE_RELATIVE_PATH)
    
    try:
        result = subprocess.run([asar_path, assemble_path, ROM_NAME])
        if result.returncode != 0:
            print("\nBuild FAILED!")
            return False
    except FileNotFoundError:
        print(f"Error: Could not find asar at {asar_path}")
        sys.exit(1)
    
    print("Build succeeded!")
    return True

def check_build():
    print("\nChecking build...\n")
    
    all_match = True
    hash_files = {
        "md5": os.path.join(BASE_DIR, HASH_MD5),
        "sha1": os.path.join(BASE_DIR, HASH_SHA1),
        "sha256": os.path.join(BASE_DIR, HASH_SHA256)
    }
    
    if os.path.exists(ROM_NAME):
        for algo, hash_file in hash_files.items():
            current_hash = get_file_hash(ROM_NAME, algo)
            if check_hash_match(current_hash, hash_file):
                print(f"{algo.upper()} match succeeded!")
            else:
                print(f"{algo.upper()} match FAILED!")
                all_match = False
    else:
        print(f'Error: "{ROM_NAME}" was not created.')
        all_match = False
    
    return all_match

def get_file_hash(filepath, algorithm):
    hash_func = hashlib.new(algorithm)
    with open(filepath, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_func.update(chunk)
    return hash_func.hexdigest()

def check_hash_match(current_hash, hash_file_path):
    if not os.path.exists(hash_file_path):
        return False
    with open(hash_file_path, "r") as f:
        content = f.read().lower()
        return current_hash.lower() in content

def compare_binaries(file1_path, file2_path, max_diffs=10):
    if not os.path.exists(file1_path) or not os.path.exists(file2_path):
        print("Error: One or both files missing for comparison.")
        return

    file1_size = os.path.getsize(file1_path)
    file2_size = os.path.getsize(file2_path)

    if file1_size != file2_size:
        print(f"Warning: File sizes differ! ({file1_size} vs {file2_size} bytes)")
    
    print("PC addr | SNES addr | Built | Original")
    
    diff_count = 0
    with open(file1_path, "rb") as f1, open(file2_path, "rb") as f2:
        offset = 0
        while True:
            byte1 = f1.read(1)
            byte2 = f2.read(1)

            # End of both files
            if not byte1 and not byte2:
                break

            if byte1 != byte2:
                diff_count += 1
                
                val1 = f"0x{byte1[0]:02X}" if byte1 else "NONE"
                val2 = f"0x{byte2[0]:02X}" if byte2 else "NONE"
                print(f"${offset:06X} | ${pc_to_snes(offset):06X}   | {val1:<5} | {val2:<5}")

                if diff_count >= max_diffs:
                    print(f"\nStopped after {max_diffs} differences.")
                    break
            
            offset += 1

    if diff_count == 0:
        print("Files are identical.")
    else:
        print(f"\nTotal differences found: {diff_count}")

def exit_prompt(exit_code):
    input("\nPress Enter to exit...")
    sys.exit(exit_code)

#############################################################################################################
# Main

# Build
build_success = build_rom()
if not build_success:
    exit_prompt(1)

# Check build
all_match = check_build()

# Compare build with user-provided rom if match failed
if not all_match:
    rom_path = input("\nEnter path to your Yoshi's Island rom to check where build differs (leave blank to skip): ").strip()
    if rom_path and os.path.exists(rom_path):
        print("\nComparing files...\n")
        compare_binaries(ROM_NAME, rom_path, max_diffs=100)
    elif rom_path:
        print("Provided ROM path does not exist.")

exit_prompt(0)