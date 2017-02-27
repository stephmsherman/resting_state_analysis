import glob, sys, os, shutil
import pandas as pd
import numpy as np

###get name of resting state analyses
phase = raw_input('phase: ')

###seed
seed = raw_input('seed: ')

##file to format matrix data
file = glob.glob('/home3/kensinel/fMRI_DATA/SleepLDF/combined_data/all_data_????-??-??.csv')

d = pd.read_csv(file[0])
##change SleepLDF to SLEEPLDF in subject names
d['subject'] = d['subject'].str.replace('Sleep','SLEEP') 

####create the two condition columns for the design matrix
d['matrix_stress'] = np.where(d['condition']=="stress",1,0)
d['matrix_control'] = np.where(d['condition']=="control",1,0)

##get list of files so know which ones have resting state data
scans = '/home3/kensinel/fMRI_DATA/SleepLDF/group_analyses/resting_state/{0}_condition/{1}/{1}_sca_roi_files_to_standard_smooth_fisher_zstd_SLEEPLDF0??.nii.gz'
rs_scans = glob.glob(scans.format(phase, seed))

##use the file paths to create the list of names of the subjects to include
names = []
for s in rs_scans:
	name = s[145:156]
	names.append(name)

###only include the important columns
d = d[['subject', 'matrix_stress', 'matrix_control']]

##make the list of resting state subjects into a dataframe
rs_sub = pd.DataFrame({'subject': names})

##merge the list of resting state subjects with the data so can only include the subjects that have data
m=pd.merge(d,rs_sub, on='subject',how ='inner')
matrix = m[['matrix_stress','matrix_control']]

##get the number of subjects
num =  matrix.shape[0]

path = ('/home3/kensinel/fMRI_DATA/SleepLDF/group_analyses/resting_state/%s_condition/' % phase)

f = open((path + '/design_%s.mat' % phase), 'w')
f.write('/NumWaves 2\n')
f.write('/NumPoints %d\n' % num)
f.write('/PPheights 1 1\n')
f.write('/Matrix\n')
matrix.to_csv(f, sep = " ",header=False,index=False)
f.close()

#randomise -i amygdala_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o output -d design.mat -t design.con -T -n 1000




