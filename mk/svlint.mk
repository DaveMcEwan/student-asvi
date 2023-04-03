
include mk/common.mk

default: lint

.PHONY: lint
lint: $(addprefix ${OUTDIR}/,$(addsuffix .svlint_lint.stdout,${TESTCASE_NAMES}))

#--version: Display the tool version.
#https://github.com/dalance/svlint/blob/master/MANUAL.md

${OUTDIR}/%.svlint_lint.stdout: testcases/%.sv | ${OUTDIR}
	svlint --version > $@
	-svlint $^ ${REDIRECT}
