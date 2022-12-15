import pandas as pd
import matplotlib.pyplot as plt
import getopt
import sys

def us_scaler(arr):
	return [x*pow(10,6) for x in arr]

tran_data = None
tran_x_axis_name = 't(us)'
tran_y_axis_name = 'Amplitude(V)'

tran_data_t = []
tran_data_v = []

argv = sys.argv[1:]
try:
	opts, args = getopt.getopt(argv, "t:")
except:
	print("Error")


for opt, arg in opts:
	if opt in ['-t']:
		tran_data = pd.read_csv(\
			arg, \
			sep='\s+', \
			header=None, \
			usecols=[0,1], \
			names=[tran_x_axis_name, tran_y_axis_name]\
		)		
## 1. Plot refer to here
## https://tinyurl.com/app/myurls
## 2. Why usecols=is [1,3] rather than [1,2]
## Depend on your OS, ngspice version..etc. env.
## Some env. is [1,3], some env. is [1,2]

tran_data_t = us_scaler(tran_data[tran_x_axis_name])
tran_data_v = tran_data[tran_y_axis_name]
plt.plot(\
	tran_data_t,\
	tran_data_v,\
	label='Transient response'\
)
plt.xlabel(tran_x_axis_name)
plt.ylabel(tran_y_axis_name)
plt.title('Transient Analys of PD-Driver: '+ argv[1] )
plt.legend()
plt.show()