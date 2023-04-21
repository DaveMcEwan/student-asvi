include mk/common.mk

default:
	make -f mk/verilator.mk
	make -f mk/yosys.mk
	make -f mk/svlint.mk
	make -f mk/icarus.mk
	make -f mk/vivado.mk
	make -f mk/questa.mk
	make -f mk/spyglass.mk
	make -f mk/dc.mk
	make -f mk/formality.mk
	make -f mk/precision.mk
	make -f mk/xcelium.mk
	make -f mk/vcformal.mk
	make -f mk/onespin.mk
	make -f mk/tessent.mk
