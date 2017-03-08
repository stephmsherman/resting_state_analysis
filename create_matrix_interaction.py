import glob, sys, os, shutil
import pandas as pd
import numpy as np

###edit so does not have hard coded names

###get name of resting state analyses
rs_analysis = raw_input('Name of Resting State Folder: ')

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
scans = '/home3/kensinel/fMRI_DATA/SleepLDF/group_analyses/resting_state/{0}/{1}/SLEEPLDF0*.nii.gz'
rs_scans = glob.glob(scans.format(rs_analysis, seed))

##use the file paths to create the list of names of the subjects to include
names = []
for s in rs_scans:
	name = s[95:106]
	names.append(name)

###only include the important columns
d = d[['subject', 'matrix_stress', 'matrix_control','dprime_neg_neut']]

d['dprime_neg_neut_m'] = d['dprime_neg_neut'] - d['dprime_neg_neut'].mean()
d['dprime_neg_neut_m1'] = d['dprime_neg_neut_m'] * d['matrix_stress'] + 0
d['dprime_neg_neut_m2'] = d['dprime_neg_neut_m'] * d['matrix_control'] + 0

##make the list of resting state subjects into a dataframe
rs_sub = pd.DataFrame({'subject': names})

##merge the list of resting state subjects with the data so can only include the subjects that have the resting state data
m=pd.merge(d,rs_sub, on='subject',how ='right')
matrix = m[['matrix_stress','matrix_control','dprime_neg_neut_m1', 'dprime_neg_neut_m2']]

##get the number of subjects
num =  matrix.shape[0]
cl = matrix.shape[1]

path = ('/home3/kensinel/fMRI_DATA/SleepLDF/group_analyses/resting_state/%s/' % rs_analysis)

f = open((path + '/design_%s.mat' % rs_analysis), 'w')
f.write('/NumWaves %d\n' % cl)
f.write('/NumPoints %d\n' % num)
f.write('/PPheights 1 1\n')
f.write('/Matrix\n')
matrix.to_csv(f, sep = " ",header=False,index=False)
f.close()

#randomise -i amygdala_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o output -d design.mat -t design.con -T -n 1000
#randomise -i amygdalaR/amygdalaR_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o amygdalaR/output -d design_pre_enc.mat -t randomise_condition.con -T -n 1000




