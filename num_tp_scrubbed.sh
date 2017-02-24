#!/usr/bin/env bash

##this script counts the number of time points following scrubbing (motion censoring) of the data from CPAC

for sub in SLEEPLDF001 SLEEPLDF002 SLEEPLDF003 SLEEPLDF004 SLEEPLDF005 SLEEPLDF006 SLEEPLDF007 SLEEPLDF008 SLEEPLDF009 SLEEPLDF010 SLEEPLDF011 SLEEPLDF012 SLEEPLDF013 SLEEPLDF014 SLEEPLDF015 SLEEPLDF016 SLEEPLDF017 SLEEPLDF018 SLEEPLDF019 SLEEPLDF020 SLEEPLDF021 SLEEPLDF022 SLEEPLDF023 SLEEPLDF024 SLEEPLDF025 SLEEPLDF026 SLEEPLDF027 SLEEPLDF028 SLEEPLDF029 SLEEPLDF030 SLEEPLDF031 SLEEPLDF032 SLEEPLDF033 SLEEPLDF034 SLEEPLDF035 SLEEPLDF036 SLEEPLDF037 SLEPELDF038 SLEEPLDF040; do

for scan in baseline pre_enc post_enc pre_ret; do

output=$(fslval /home3/kensinel/fMRI_DATA/SleepLDF/$scan\_resting_state/pipeline_REST/$sub/scrubbed_preprocessed/_scan_func_$sub\_*/_csf_threshold_0.96/_gm_threshold_0.7/_wm_threshold_0.96/_threshold_0.3/_compcor_ncomponents_5_selector_pc10.linear1.wm1.global1.motion1.quadratic1.gm0.compcor0.csf1/_bandpass_freqs_0.005.0.1/scrubbed_preprocessed.nii.gz dim4)

echo $sub $output $scan >> /home3/kensinel/fMRI_DATA/SleepLDF/$scan\_resting_state/num_tp_post_scrub.txt

done
done

