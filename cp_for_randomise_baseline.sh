#!/usr/bin/env bash

##this script takes the preprocessed resting state data, combines it in preparation for completing statistical analyses using randomise
seed=$1 #hippo amygdala
resting_state=/home3/kensinel/fMRI_DATA/SleepLDF/baseline_resting_state
mkdir $resting_state/randomise/$seed

for sub in SLEEPLDF001 SLEEPLDF002 SLEEPLDF003 SLEEPLDF004 SLEEPLDF005 SLEEPLDF006 SLEEPLDF007 SLEEPLDF008 SLEEPLDF009 SLEEPLDF010 SLEEPLDF011 SLEEPLDF012 SLEEPLDF013 SLEEPLDF014 SLEEPLDF015 SLEEPLDF016 SLEEPLDF017 SLEEPLDF018 SLEEPLDF019 SLEEPLDF020 SLEEPLDF021 SLEEPLDF022 SLEEPLDF023 SLEEPLDF024 SLEEPLDF025 SLEEPLDF026 SLEEPLDF027 SLEEPLDF028 SLEEPLDF029 SLEEPLDF030; do

cp $resting_state/sym_links/pipeline_REST/linear1.wm1.global1.motion1.quadratic1.csf1_CSF_0.96_GM_0.7_SCRUB_0.3_WM_0.96/$sub/scan_func_$sub\_baseline/sca_roi/mask_$seed/bandpass_freqs_0.005.0.1/fwhm_5/sca_roi_files_to_standard_smooth_fisher_zstd.nii.gz $resting_state/randomise/$seed/$seed\_sca_roi_files_to_standard_smooth_fisher_zstd_$sub.nii.gz

done

#fslmerge -t $resting_state/randomise/$seed/$seed\_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz $resting_state/randomise/$seed/$seed\_sca_roi_files_to_standard_smooth_fisher_zstd_SLEEPLDF*.nii.gz

