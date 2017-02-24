#!/usr/bin/env bash
#######if add more participants need to move old output file
#####this script is specific to the vmpfc
##in order for script to run must have ROI mask for vmpfc in std_space_rois folder (vmpfc_6mm.nii.gz)

for sub in SLEEPLDF001 SLEEPLDF002 SLEEPLDF003 SLEEPLDF004 SLEEPLDF005 SLEEPLDF006 SLEEPLDF007 SLEEPLDF008 SLEEPLDF009 SLEEPLDF010 SLEEPLDF011 SLEEPLDF012 SLEEPLDF013 SLEEPLDF014 SLEEPLDF015 SLEEPLDF016 SLEEPLDF017 SLEEPLDF018 SLEEPLDF019 SLEEPLDF020 SLEEPLDF021 SLEEPLDF022 SLEEPLDF023 SLEEPLDF024 SLEEPLDF025 SLEEPLDF026 SLEEPLDF027 SLEEPLDF028 SLEEPLDF029 SLEEPLDF030 SLEEPLDF031 SLEEPLDF032 SLEEPLDF033 SLEEPLDF034 SLEEPLDF035 SLEEPLDF036 SLEEPLDF037 SLEEPLDF038 SLEEPLDF039 SLEEPLDF040; do

for seed in amygdala amygdalaL amygdalaR hippo hippoL hippoR; do
scan=$1 #pre_ret or baseline pre_enc

resting_state=/home3/kensinel/fMRI_DATA/SleepLDF/$scan\_resting_state

input=$resting_state/sym_links/pipeline_REST/linear1.wm1.global1.motion1.quadratic1.csf1_CSF_0.96_GM_0.7_SCRUB_0.3_WM_0.96/$sub/scan_func_$sub\_*/sca_roi/mask_$seed/bandpass_freqs_0.005.0.1/fwhm_5/sca_roi_files_to_standard_smooth_fisher_zstd.nii.gz

output=$(fslmeants -i $input -m $resting_state/std_space_rois/vmpfc_6mm.nii.gz)

echo $sub $output >> $resting_state/std_space_rois/vmpfc_6mm_$seed\_$scan.txt

echo $sub $seed
done

done