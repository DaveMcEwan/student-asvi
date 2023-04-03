# Load Mentor Precision tool
# module load mentor/precision/2022.2
include mk/common.mk

default: synthesize

.PHONY: synthesize
synthesize: $(addprefix ${OUTDIR}/,$(addsuffix \
.precision_synth.stdout,${TESTCASE_NAMES}))

# See Precision Synthesis Quick Start Guide,
#  Software Version PS2022.2, December 2022 (ps_quickstart_guide.pdf)
#  Pages 33, 34, 35, 36 - 45, 74 - 76
# See Precision Synthesis Reference Manual, Release PS2022.2, December 2022
#  precisionsyn_ref.pdf.
# 	Pages 360, 216, 101, 122, 417, 243 & 247 for commands used in tcl script.
# 	Pages 233 - 234 for options to precision command.
# -shell: Invoke precision synthesis in command-line mode.
# -logfile: Keeps log of actions from current session/ commands.
# -file: Source a tcl file after Precision is invoked; runs commands in script.
# -fileargs: Pass argunents to the TCL file.

${OUTDIR}/%.precision_synth.stdout: testcases/%.sv | ${OUTDIR}
	-precision -shell -logfile out/precision.log \
	-file tcl/precision_batch_run.tcl -fileargs $^ ${REDIRECT}
