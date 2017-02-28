#!/usr/bin/env bash

###in this analysis I was interested in examining how connectivity changed following the stress condition
## I took the pre_enc minus baseline and then conducted a one sample t-test on the difference.
##This essentially is like conducted a paired t-test in two steps

for seed in amygdala amygdalaL amygdalaR hippo hippoL hippoR; do
baseline=/home3/kensinel/fMRI_DATA/SleepLDF/baseline_resting_state
pre_enc=/home3/kensinel/fMRI_DATA/SleepLDF/pre_enc_resting_state
mkdir -p /home3/kensinel/fMRI_DATA/SleepLDF/group_analyses/resting_state/pre_enc_minus_baseline_stress/$seed
group=/home3/kensinel/fMRI_DATA/SleepLDF/group_analyses/resting_state/pre_enc_minus_baseline_stress

##only stress participants
for sub in SLEEPLDF002 SLEEPLDF003 SLEEPLDF004 SLEEPLDF006 SLEEPLDF007 SLEEPLDF008 SLEEPLDF009 SLEEPLDF010 SLEEPLDF011 SLEEPLDF017 SLEEPLDF018 SLEEPLDF019 SLEEPLDF024 SLEEPLDF027 SLEEPLDF029 SLEEPLDF031 SLEEPLDF033 SLEEPLDF035 SLEEPLDF037; do

fslmaths $pre_enc/sym_links/pipeline_REST/linear1.wm1.global1.motion1.quadratic1.csf1_CSF_0.96_GM_0.7_SCRUB_0.3_WM_0.96/$sub/scan_func_$sub\_*/sca_roi/mask_$seed/bandpass_freqs_0.005.0.1/fwhm_5/sca_roi_files_to_standard_smooth_fisher_zstd.nii.gz -sub $baseline/sym_links/pipeline_REST/linear1.wm1.global1.motion1.quadratic1.csf1_CSF_0.96_GM_0.7_SCRUB_0.3_WM_0.96/$sub/scan_func_$sub\_*/sca_roi/mask_$seed/bandpass_freqs_0.005.0.1/fwhm_5/sca_roi_files_to_standard_smooth_fisher_zstd.nii.gz $group/$seed/$sub\_pre_enc_baseline.nii.gz

done

fslmerge -t $group/$seed/pre_enc_baseline_all.nii.gz $group/$seed/SLEEPLDF0*_pre_enc_baseline.nii.gz

randomise -i $group/$seed/pre_enc_baseline_all.nii.gz -o $group/$seed/output -1 -T -n 1000
done

