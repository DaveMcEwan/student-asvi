
include mk/common.mk

default: read

.PHONY: read

read: $(addprefix ${OUTDIR}/,$(addsuffix .yosys_read.stdout,${TESTCASE_NAMES}))
# See Yosys Manual, Version 2023
#   Pages 157, 281, 89
# -q: Suppress yosys invocation message on start-up; do not print output.
# -p: Specify yosys commands on the command line.
# -sv: Enable support for SystemVeerilog features.

${OUTDIR}/%.yosys_read.stdout: testcases/%.sv | ${OUTDIR}
	-yosys -q -p "read_verilog -sv $^; proc; opt" ${REDIRECT}
