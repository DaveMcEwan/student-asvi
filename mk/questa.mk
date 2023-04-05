include mk/common.mk

default: lint simulate

# module load mentor/questasim/2022.2_1

.PHONY: lint
simulate: $(addprefix ${OUTDIR}/,$(addsuffix .questa_lint.stdout,${TESTCASE_NAMES}))

.PHONY: simulate
simulate: $(addprefix ${OUTDIR}/,$(addsuffix .questa_vsim.stdout,${TESTCASE_NAMES}))

# See Questa SIM Command Reference Manual v2023.1, pages 868,880,887.
# -lint: Issue warnings on (very basic) static checks.
# -sv: Enable SystemVerilog features and keywords.
# -sv17compat: Used in conjunction with `-sv` to ensure compatibility
#              with the reserved keyword set of IEEE1800-2017.
${OUTDIR}/%.questa_lint.stdout: testcases/%.sv | ${OUTDIR}
	-vlog -sv -sv17compat -lint=default $^ ${REDIRECT}

# See Questa SIM Command Reference Manual v2023.1, pages 880.
# -lint: Issue warnings on (very basic) static checks.
# -sv: Enable SystemVerilog features and keywords.
${OUTDIR}/%.questa_vlog.stdout: testcases/%.sv testbench/tb.sv | ${OUTDIR}
	vlog -sv -lint=full $^ ${REDIRECT}

# See Questa SIM Command Reference Manual v2023.1, pages 880.
# -o <name>: Provide a name for the optimized version of the design unit.
${OUTDIR}/%.questa_vopt.stdout: ${OUTDIR}/%.questa_vlog.stdout
	vopt tb -o design_unit ${REDIRECT}

# See Questa SIM Command Reference Manual v2023.1, pages 1003.
# -c: Run in command-line mode.
#     See Questa SIM User's Manual v2022.2, page72.
# -do: Instruct vsim to use string of commands, instead of a DO file.
${OUTDIR}/%.questa_vsim.stdout: ${OUTDIR}/%.questa_vopt.stdout
	vsim -c design_unit -do "run -all; quit -f" ${REDIRECT}
