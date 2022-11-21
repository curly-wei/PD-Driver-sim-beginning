pyutil_path = ./pyutil

cir_dir = ./cir
cir_files = tb.cir IVCvT.cir PDMod.cir

sim_target = pd-tran.ssv

sim_deps = \
	$(foreach i,${cir_files},$(addprefix ${cir_dir}/,${i}))

sim_file = ${cir_dir}/tb.cir

.PHONY: clean

default: plot

sim: ${sim_target}
${sim_target}: ${sim_deps}
	ngspice ${sim_file}

plot: sim
	python3 ${pyutil_path}/plt-tran.py -t ${sim_target}

clean:
	rm -r *.ssv