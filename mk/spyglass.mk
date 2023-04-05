include mk/common.mk
SPYGLASS_WORK_DIR := spyglass
default: lint

.PHONY: lint
lint: $(addprefix ${OUTDIR}/,$(addsuffix .spyglass_lint.txt,${TESTCASE_NAMES}))
export TESTCASE = $^
export TESTCASE_REPORT = $@
${OUTDIR}/%.spyglass_lint.txt: testcases/%.sv | ${OUTDIR}
	mkdir -p ${SPYGLASS_WORK_DIR}
	sg_shell < tcl/spyglass_batch_run.tcl
