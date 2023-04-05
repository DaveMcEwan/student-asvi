include mk/common.mk

default: compile

.PHONY: compile
compile: $(addprefix ${OUTDIR}/,$(addsuffix \
.onespin_compile.stdout,${TESTCASE_NAMES}))

export TESTCASE = $^
export TESTCASE_REPORT = $@

${OUTDIR}/%.onespin_compile.stdout: testcases/%.sv | ${OUTDIR}
	-onespin --gui=no tcl/onespin_batch_run.tcl
