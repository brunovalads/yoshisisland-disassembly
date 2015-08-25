SPASM by Raidenthequick and Alexander

This patch is only compatible with asar.

Patching instructions:

1) Locate the index of the level you want to add code to in level_code.asm and/or level_init_code.asm and put your code there. Save.
2) Patch your game with asar like normal; syntax is "asar.exe level.asm rom.sfc" (smc also works)
3) Enjoy!

Other notes:
Do not modify level.asm at all. It'll break your computer, trust me.

The default processor state is both A & X/Y in 16-bit modes. The patch will not break if you
neglect to reset the processor before you return, but you should anyway.

Questions or bugs? Fire off a PM to Raidenthequick on SMWCentral and let him know.