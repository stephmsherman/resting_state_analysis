#!/usr/bin/env bash
seed=$1
resting_state=/home3/kensinel/fMRI_DATA/SleepLDF/pre_ret_resting_state
mkdir $resting_state/randomise/$seed

##removed 10 15 and 25 because of negative dprime values and excessive motion

for sub in SLEEPLDF001 SLEEPLDF002 SLEEPLDF003 SLEEPLDF004 SLEEPLDF005 SLEEPLDF006 SLEEPLDF007 SLEEPLDF008 SLEEPLDF009 SLEEPLDF011 SLEEPLDF012 SLEEPLDF013 SLEEPLDF014 SLEEPLDF016 SLEEPLDF017 SLEEPLDF018 SLEEPLDF019 SLEEPLDF020 SLEEPLDF021 SLEEPLDF022 SLEEPLDF023 SLEEPLDF024 SLEEPLDF026 SLEEPLDF027 SLEEPLDF028 SLEEPLDF029 SLEEPLDF030; do

cp $resting_state/sym_links/pipeline_REST/linear1.wm1.global1.motion1.quadratic1.csf1_CSF_0.96_GM_0.7_SCRUB_0.3_WM_0.96/$sub/scan_func_$sub\_preret/sca_roi/mask_$seed/bandpass_freqs_0.005.0.1/fwhm_5/sca_roi_files_to_standard_smooth_fisher_zstd.nii.gz $resting_state/randomise/$seed/$seed\_sca_roi_files_to_standard_smooth_fisher_zstd_$sub.nii.gz

done

fslmerge -t $resting_state/randomise/$seed/$seed\_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz $resting_state/randomise/$seed/$seed\_sca_roi_files_to_standard_smooth_fisher_zstd_SLEEPLDF*.nii.gz


#randomise -i hippoL_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o hippoL_group_mean -1 -T -n 1000

#randomise -i hippoL_n30/hippoL_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o hippoL_n30/hippoL_condition -d randomise.mat -t randomise.con -T -n 1000

#randomise -i amygdalaR/amygdalaR_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o amygdalaR/amygdalaR_interaction -d interaction_dprime_neg_neut_n27.mat -t interaction_dprime_neg_neut_n27.con -T -n 1000

#randomise -i hippoL/hippoL_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o hippoL/hippoL_interaction -d interaction_dprime_neg_neut_n27.mat -t interaction_dprime_neg_neut_n27.con -T -n 1000


#randomise -i amygdalaR_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o amygdalaR_group_mean -1 -T -n 1000

#randomise -i amygdalaR_n30/amygdalaR_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o amygdalaR_n30/amygdalaR_condition -d randomise.mat -t randomise.con -T -n 1000

#randomise -i vmpfc_6mm_sca_roi_files_to_standard_smooth_fisher_zstd_all.nii.gz -o vmpfc_6mm_group_mean -1 -T -n 1000
