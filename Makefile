pyutil_path = ./pyutil

cir_dir = ./cir
cir_files = \
	PDMod.cir \
	IVCvT_OPA192.cir \
	IVCvT_OPA810.cir \
	IVCvT_LMH6601.cir \
	IVCvT_ADA4817.cir 

tb_file_opa192 = ${cir_dir}/tb_opa192.cir
tb_file_opa810 = ${cir_dir}/tb_opa810.cir
tb_file_lmh6601= ${cir_dir}/tb_lmh6601.cir
tb_file_ada4817 = ${cir_dir}/tb_ada4817.cir

sim_target_opa192 = pd-tran-opa192.ssv
sim_target_opa810 = pd-tran-opa810.ssv
sim_target_lmh6601 = pd-tran-lmh6601.ssv
sim_target_ada4817 = pd-tran-ada4817.ssv

cir_deps = \
	$(foreach i,${cir_files},$(addprefix ${cir_dir}/,${i}))

.PHONY: clean

###############################
## Run Sim
###############################
default:
	$(error "please set the simlulation target, e.g. make opa192")

#######
# Top #
#######
opa192: sim_opa192 plot_opa192
opa810: sim_opa810 plot_opa810
lmh6601: sim_lmh6601 plot_lmh6601
ada4817: sim_ada4817 plot_ada4817

#######
# Sim #
#######
sim_opa192: ${sim_target_opa192}
${sim_target_opa192}: ${cir_deps} ${tb_file_opa192}
	ngspice ${tb_file_opa192}
sim_opa810: ${sim_target_opa810}
${sim_target_opa810}: ${cir_deps} ${tb_file_opa810}
	ngspice ${tb_file_opa810}
sim_lmh6601: ${sim_target_lmh6601}
${sim_target_lmh6601}: ${cir_deps} ${tb_file_lmh6601}
	ngspice ${tb_file_lmh6601}
sim_ada4817: ${sim_target_ada4817}
${sim_target_ada4817}: ${cir_deps} ${tb_file_ada4817}
	ngspice ${tb_file_ada4817}

########
# Plot #
########
plot_opa192:
	python3 ${pyutil_path}/plt-tran.py -t ${sim_target_opa192}
plot_opa810:
	python3 ${pyutil_path}/plt-tran.py -t ${sim_target_opa810}
plot_lmh6601: 
	python3 ${pyutil_path}/plt-tran.py -t ${sim_target_lmh6601}
plot_ada4817: 
	python3 ${pyutil_path}/plt-tran.py -t ${sim_target_ada4817}

clean:
	rm -r *.ssv
