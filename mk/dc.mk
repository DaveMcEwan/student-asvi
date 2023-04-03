include mk/common.mk

default: compile

# Load Synopsys DC(syn) tool.
# module load synopsys/syn/2212-sp2

.PHONY: compile
compile: $(addprefix ${OUTDIR}/,$(addsuffix .dc_compile.stdout,\
${TESTCASE_NAMES}))

# See Design Compiler User Guide, Version P-2019.03, March 2019 (dcug.pdf)
# 				pages 55, 57, 65 & 66
# See Design Compiler, Version 2022.12-SP2 manual for commands
# 				cat1 -> dc_shell.1
#					cat2 -> read_sverilog.2, compile.2, remove_design.2

# -x: Executes dc_shell in command_string.
#				 Allows multiple commands to be entered.

${OUTDIR}/%.dc_compile.stdout: testcases/%.sv | ${OUTDIR}
	dc_shell -x "read_sverilog $^;compile;remove_design -designs;quit" ${REDIRECT}

