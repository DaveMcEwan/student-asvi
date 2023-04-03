
# All generated files should go under a single directory.
OUTDIR := out
TESTCASES := $(filter-out %/template.sv, $(wildcard testcases/*.sv))
TESTCASE_NAMES := $(basename $(notdir ${TESTCASES}))

# Targets for tool output should have `.stdout` suffix.
# This substitution alias should be used as the last argument to tool commands.
# Use like:
#    ${OUTDIR}/%.sometool.stdout: testcases/%.sv
#      sometool $^ ${REDIRECT}
REDIRECT = > $@ 2> $(subst stdout,stderr,$@) || (echo "FAILURE" >> $@)


# Always use the name `default` as the default target.
# This relies on this file being included at the beginning of each Makefile.
.PHONY: default
default: | ${OUTDIR}

${OUTDIR}:
	mkdir -p ${OUTDIR}

# Disable suffix rules and pattern rules.
.SUFFIXES:
MAKEFLAGS += -r

# Disable Make's default behaviour of removing intermediate targets.
# https://www.gnu.org/software/make/manual/html_node/Special-Targets.html
.NOTINTERMEDIATE:
.SECONDARY:

.PHONY: clean
clean:
	rm -rf ${OUTDIR}
	rm -rf work
	rm -rf spyglass
	rm -rf vcformal
	rm -f command.log
	rm -f default.svf
	rm -rf simv.da*
	rm -f *.psp
	rm -rf impl_*
	rm -rf rc.*
	rm -f sg_shell.log
	rm -rf xcelium.d
	rm -f xmsim.key
	rm -rf .Xil
	rm -f transcript
	rm -f elab_summary*
	rm -f core.*
