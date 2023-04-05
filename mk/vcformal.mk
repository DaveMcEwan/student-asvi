include mk/common.mk

default: compile

.PHONY: compile
compile: $(addprefix ${OUTDIR}/,$(addsuffix \
.vcformal_compile.log,${TESTCASE_NAMES}))

export TESTCASE = $^
export TESTCASE_REPORT = $@

${OUTDIR}/%.vcformal_compile.log: testcases/%.sv | ${OUTDIR}
	-vcf -batch -out_dir vcformal -f tcl/vcformal_batch_run.tcl
