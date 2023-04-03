# Load Cadence Xcelium tool
# module load cadence/xcelium/22.03.004

include mk/common.mk

default: simulate

.PHONY: simulate
simulate: $(addprefix ${OUTDIR}/,$(addsuffix \
.xcelium_simulate.stdout,${TESTCASE_NAMES}))

# See Cadence Xcelium Overview and syntax html files.
#   .../vlogcompopts/Overview_and_Syntax.html
# 		.../ElaboratorOptions/Overview_and_Syntax.html
# 		.../SimulatorOptions/Overview_and_Syntax.html
# 		.../xsctutorial/Preparing_Your_Design_for_Simulation.html
# -sv: Enable SystemVerilog language constructs.
# -nocopyright: Do not print copyright banner.
# -nolog: Do not generate a logfile.

XCELIUM_TOP ?= tb
${OUTDIR}/%.xcelium_read.stdout: testcases/%.sv testbench/tb.sv | ${OUTDIR}
	-xmvlog -sv -nocopyright -nolog $^ ${REDIRECT}

${OUTDIR}/%.xcelium_elaborate.stdout: ${OUTDIR}/%.xcelium_read.stdout
	-xmelab -nocopyright -nolog ${XCELIUM_TOP} ${REDIRECT}

${OUTDIR}/%.xcelium_simulate.stdout: ${OUTDIR}/%.xcelium_elaborate.stdout
	-xmsim -nocopyright -nolog ${XCELIUM_TOP} ${REDIRECT}
