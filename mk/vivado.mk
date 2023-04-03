include mk/common.mk

default: synthesize

.PHONY: synthesize
synthesize: $(addprefix ${OUTDIR}/,$(addsuffix .vivado_synth.stdout,${TESTCASE_NAMES}))

# See Vivado Design Suite User Guide v2022.1 page 8
# See Vivado Design Suite TCL Command Reference Guide (UG835) v2022.1
#  Pages 3, 4, 1202, 1762, 1763 & 1767.
# -mode: Specify which mode Vivado should be run. i.e tcl, gui or batch mode.
# -nojournal: No journal(vivado.jou) is generated.
# -nolog: No log file(vivado.log) is generated.
# -source: Add/specify a tcl file to to be run after invoking Vivado.
# -tclargs: Pass arguments to the Vivado command (tcl script being run).
# In tcl script - Non-Project mode (no project is created)
# -sv: Enable SystemVerilog Compilation
# -top: Specify top level design
# -lint: Check for potential violations of various rules in source files.
# -part: Target device/part (Kintex 7 in use)

${OUTDIR}/%.vivado_synth.stdout: testcases/%.sv | ${OUTDIR}
	-vivado -mode batch -nojournal -nolog -source tcl/vivado_batch_run.tcl \
	-tclargs	$^ ${REDIRECT}
