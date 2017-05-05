# Super Mario World 2: Yoshi's Island (SNES) Disassembly

### by Raidenthequick and TheGreekBrit

Full Disassembly including:

- 65816 code
- Super FX code
- SPC-700 code
- data sections

Disassembly is 100% finished, assembles under asar and produces a fully clean ROM. Do `asar/asar disassembly/assemble.asm yi.sfc` to assemble the full ROM.

Not all code is documented, however, so we would welcome any efforts in documentation including naming labels and comments, etc.

Please make sure, before you submit any changes, corrections, or documentation, that the code still assembles correctly and still produces a clean ROM (please run a diff or hash compare with a clean U 1.0 ROM to find out).

Target version:
**V1.0 (NTSC-US)**

Consult the [Yoshi's Island Technical Information Wiki](http://yoshidis.wikia.com), [ROM Map](http://www.smwcentral.net/?p=nmap&m=yirom), [RAM Map](http://www.smwcentral.net/?p=nmap&m=yiram), and [SRAM Map](http://www.smwcentral.net/?p=nmap&m=yisram) for technical information about the game that was found using this disassembly.

## Naming conventions:

### Labels
- Please use `all_lowercase_and_underscore_delimiting` for label names.
- Maximum label / variable name length is currently **32 characters**. This is because of current spacing and addressing modes to take into account.
- Put parent labels at the top of every major piece of code, such as a subroutine, interrupt routine, entity or operation.
- Try to be somewhat brief in naming parent labels.
- Use .sublabels for minor labels within the parent label's code (i.e. before hitting the next parent label).
- Feel free to use ..nested_sublabels for better organization when beneficial.

Example:

    init_hookbill:
      ...

    .fog_fade
      ...

    ..ret
      RTS


- For "long" entry points of subroutines (often these just change the data bank to the current bank), create an additional parent label above the major one but add suffix `_l`.

Example:

    main_loop_0F_l:
      PHB
      PHK
      PLB

    main_loop_0F:
      ...

- For other entry points within a parent label, use .sublabels as you would for any minor label, and simply call it via label_sublabel from calling code.
- Use `.ret` for when a piece of code is primarily meant to return, including `RTS`, `RTL`, and any stack or other cleanup.
- If there are multiple return points that essentially have differing forms of cleanup, use a distinct suffix for the type of cleanup. However, plain `.ret` should still be used on the last one regardless.

Example:

    .ret_sep
      SEP #$30

    .ret
      PLB
      RTL

- Use a parent or sublabel for most data tables. Exception: There are cases when data is found amongst code, like calls to $00BE39 and the like. These take data from the caller's address as parameters, so they are not referenced directly and hence do not need labels; comments should serve nicely.
- ..nested_sublabels should not be used for data.
- Feel free to replace `$hex` addresses in code with data labels, but please first check if you need to do any label arithmetic to make it correct. Often the tables will be referenced a bit off from where they actually are, due to code like `PHA RTS` or the nature of `$00` sometimes not being a valid index. Example: `JSR (item_use_ptr-2,x)`
- Prefix conventions:
  - `init_` should be applied when a piece of code is meant to set something up and only runs one time for the lifespan of the operation / entity.
  - `main_` should be applied when a piece of code is meant to run every frame for a given operation / entity; it's what is driving it.
  - `check_` should be applied when a piece of code is primarily meant to check and see whether a certain operation / entity needs to be initialized, updated, or destroyed.
  - `gsu_` should be applied for *all* Super FX routines.
- Suffix conventions:
  - `_ptr` for pointer tables
  - `_state_ptr` or `.state_ptr` specifically for state pointer tables

### Variables

- Please use `!all_lowercase_and_underscore_delimiting` for variable names.
- Prefix conventions:
  - `reg_` for SNES hardware registers
  - `gsu_` for Super FX registers
  - `r_` for RAM, meaning $0000-$1FFF when data bank is $00-$3F, and $7E0000-$7FFFFF
  - `s_` for SRAM, meaning $6000-$7FFF when data bank is $00-$3F, and $700000-$71FFFF
  - `s_spr_` specifically for sprite tables in SRAM

- Suffix conventions:
  - `_l` for long (24-bit) addresses

### Constants
Use `ALL_CAPS_UNDERSCORE` for constants, example:

    HOOKBILL_HEALTH = #$0003

### Bugs
If you come across a bug in the original code, please mark it in the comments with a bug name that begins with `BUG_`. Then, somewhere above the section or routine it's found in, put the same `BUG_xxxxx` name and describe it in more detail there. Example:

    ; BUG_wavy_column_bounds
    ; this should have checked > 1FC1 because the check
    ; aims to prevent corruption of anything outside of
    ; 1FC2-1FE1, but instead it checks >= 1FC1, so it
    ; DOES corrupt 1FC1, which is part of a different table
    .wavy_column_loop
      dec   r11                                 ; $089E50 |\  wavy_column_loop exit condition:
      bmi .wavy_loop_continue                   ; $089E51 | | wavy_width_counter has
      nop                                       ; $089E53 |/  exceeded width
      iwt   r0,#$1FC1                           ; $089E54 |\  BUG_wavy_column_bounds
      cmp   r5                                  ; $089E57 | | screen bounds check for wavy column table
      beq .flag_on_1FC2                         ; $089E59 | | if wavy_column_address <= $1FC1
      nop                                       ; $089E5B | | then don't corrupt non-1FC2~1FE1 memory
      bcs .check_end_of_1FC2                    ; $089E5C | | so ignore flagging on
      nop                                       ; $089E5E |/  else flag on
