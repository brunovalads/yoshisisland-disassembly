.PHONY: clean

ASAR?=asar

DEPS=$(wildcard disassembly/*.asm) \
     $(wildcard disassembly/gfx/*.asm) \
     $(wildcard disassembly/gfx/*.bin) \

ROM_NAME_BASE=yi
ROM_NAME=$(ROM_NAME_BASE).sfc

SUM_KINDS=.md5sum .sha1sum .sha256sum
ROM_SUMS=$(addprefix $(ROM_NAME_BASE),$(SUM_KINDS))

SUMS=$(ROM_NAME)

validate_all: validate_md5 validate_sha1 validate_sha256

validate_md5 :: $(ROM_NAME)
	md5sum -c $(ROM_NAME_BASE).md5sum
validate_sha1  :: $(ROM_NAME)
	sha1sum -c $(ROM_NAME_BASE).sha1sum
validate_sha256  :: $(ROM_NAME)
	sha256sum -c $(ROM_NAME_BASE).sha256sum

$(ROM_NAME): $(DEPS)
	$(ASAR) ./disassembly/assemble.asm $(ROM_NAME)

clean:
	rm -f yi.sfc
