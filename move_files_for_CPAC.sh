#!/usr/bin/env bash

##double check this script

#SLEEPLDF001 SLEEPLDF002 SLEEPLDF003 SLEEPLDF004 SLEEPLDF005 SLEEPLDF006 SLEEPLDF007 SLEEPLDF008 SLEEPLDF009 SLEEPLDF010 SLEEPLDF011 SLEEPLDF012 SLEEPLDF013 SLEEPLDF014 SLEEPLDF015 SLEEPLDF016 SLEEPLDF017 SLEEPLDF018 SLEEPLDF019 SLEEPLDF020 SLEEPLDF021 SLEEPLDF022 SLEEPLDF023 SLEEPLDF024 SLEEPLDF025 SLEEPLDF026 SLEEPLDF027 SLEEPLDF028 SLEEPLDF029 SLEEPLDF030 SLEEPLDF031 SLEEPLDF032 SLEEPLDF033 SLEEPLDF034 SLEEPLDF035 SLEEPLDF036 SLEEPLDF037

for sub in SLEEPLDF040; do
study_path="/home3/kensinel/fMRI_DATA/SleepLDF"

for scan in baseline post_enc post_enc pre_ret; do

##this if statement is present because the name of the pre_ret resting state scan was made preret
if [ $scan = pre_ret ]; then
	name=preret 
else
	name=$scan
fi

mkdir -p $study_path/$scan\_resting_state/$sub/anat 
mkdir $study_path/$scan\_resting_state/$sub/func


cp $study_path/$sub\_unpack/struc/anat/mri/os*.nii.gz $study_path/$scan\_resting_state/$sub/anat/$sub\_memprage.nii.gz

cp $study_path/$sub\_unpack/resting_state/resting_state_$scan/$sub\_resting_state_$scan.nii.gz $study_path/$scan\_resting_state/$sub/func/$sub\_$name.nii.gz
done
done


