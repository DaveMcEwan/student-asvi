include mk/common.mk

default: lint

.PHONY: lint
lint: $(addprefix ${OUTDIR}/,$(addsuffix .verilator_lint.stdout,${TESTCASE_NAMES}))

# See Verilator maunual, Release Devel 5.009, Wilson Snyder 2023-03-18
# --lint-only: Lint the design - check for warnings & errors; no output file.
#   Pages 16(19) & 77(80).
# -Wall: Enable all warning and writing style messages (enables stronger linting).
#   Pages 85(88), 2(5) & 68(71).

${OUTDIR}/%.verilator_lint.stdout: testcases/%.sv | ${OUTDIR}
	-verilator --lint-only -Wall $^ ${REDIRECT}
