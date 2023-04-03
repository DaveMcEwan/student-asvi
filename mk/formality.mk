#To Do: Add implementation design & match step before verify command
#To Do: Make similar designs without interfaces

# Load Synopsys formality tool.
# module load synopsys/formality/2022.12-sp2

include mk/common.mk

default: read

.PHONY: read
read: $(addprefix ${OUTDIR}/,$(addsuffix .formality_read.stdout,${TESTCASE_NAMES}))

# See Synopsys Formality User Guide, Version P-2019.03, March 2019 (forug.pdf)
#     Pages 33, 34, 35, 40, 41, 64, 102 & 106.
# -work_path: Specifies the working directory; all generated files by formality
#     goes here.
# -x: Executes fm_shell command strings.
# -r: Sets the SV file(s) as the reference design.
# -auto: Automatically identify and set the top-level design.

${OUTDIR}/%.formality_read.stdout: testcases/%.sv | ${OUTDIR}
	-fm_shell -work_path out/formality -x \
	"read_sverilog -r $^;set_top -auto;verify;quit" ${REDIRECT}
