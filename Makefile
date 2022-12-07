pyutil_path = ./pyutil

cir_dir = ./cir
cir_files = \
	PDMod.cir \
	IVCvT_OPA192.cir \
	IVCvT_OPA810.cir 

tb_file_opa192 = ${cir_dir}/tb_opa192.cir
tb_file_opa810 = ${cir_dir}/tb_opa810.cir

sim_target_opa192 = pd-tran-opa192.ssv
sim_target_opa810 = pd-tran-opa810.ssv


cir_deps = \
	$(foreach i,${cir_files},$(addprefix ${cir_dir}/,${i}))

.PHONY: clean

###############################
## Run Sim
###############################
default:
	$(error "please set the simlulation target, e.g. make opa192")

opa192: sim_opa192 plot_opa192
opa810: sim_opa810 plot_opa810

sim_opa192: ${sim_target_opa192}
${sim_target_opa192}: ${cir_deps}
	ngspice ${tb_file_opa192}

sim_opa810: ${sim_target_opa810}
${sim_target_opa810}: ${cir_deps}
	ngspice ${tb_file_opa810}

plot_opa192:
	python3 ${pyutil_path}/plt-tran.py -t ${sim_target_opa192}
plot_opa810:
	python3 ${pyutil_path}/plt-tran.py -t ${sim_target_opa810}

clean:
	rm -r *.ssv
