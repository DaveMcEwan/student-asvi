include mk/common.mk

default: lint

.PHONY: lint
lint: $(addprefix ${OUTDIR}/,$(addsuffix .icarus_lint.stdout,${TESTCASE_NAMES}))

# -tnull: No specific target for compilation; no code generation.
# -g2012: Select the IEEE1800-2012 standard.
# -Wall: Display all warnings.
# -i: Ignore missing modules.
# https://www.mankier.com/1/iverilog

${OUTDIR}/%.icarus_lint.stdout: testcases/%.sv | ${OUTDIR}
	-iverilog -tnull -g2012 -Wall -i $^ ${REDIRECT}
