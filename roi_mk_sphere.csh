#!/bin/csh -ef


## usage: roi_mk_sphere.csh <roi_name> <vox_x_coor> <vox_y_coor> <vox_z_coor> <kernel_size_in_mm>
## example: roi_mk_sphere.csh rIFG 5 10 50 8
## critical to use voxel coordinates not MNI coordinates


#vmpfc mni is 8 44 4
#voxel 41 85 38
## make roi sphere
set resting_state = /home3/kensinel/fMRI_DATA/SleepLDF/pre_ret_resting_state
set mni = $FSLDIR/data/standard/MNI152_T1_2mm
set roi = $1
set roi_dir = $resting_state/std_space_rois
echo $roi_dir
fslmaths $mni -mul 0 -add 1 -roi $2 1 $3 1 $4 1 0 1 $roi_dir/$roi\_point -odt float
fslmaths $roi_dir/$roi\_point -kernel sphere $5 -fmean -bin $roi_dir/$roi\_$5mm 
rm $roi_dir/$roi\_point.nii.gz
echo "$roi done"

## make norm_vec.R file for roi

set ofile = $roi_dir/norm_vec_$roi\_$5mm.R
set tempfile = $roi_dir/norm_vec_temp.R
cp $roi_dir/norm_vec.R $ofile

## replace ROI name
sed s-ROINAME-{$roi\_$5mm}-g <$ofile>$tempfile
cp $tempfile $ofile

rm $tempfile

#To create spheres
#Based on peak activation (use make_func_roi2.m)
#Set zstat image, threshold, etc.

#Multiply spheres by binary brain to eliminate anything off brain
#cd (file where all the rois are)
#foreach s (*.nii.gz)
#fslmaths $s -mul /Applications/fsl/data/standard/MNI152_T1_2mm_brain_mask.nii.gz $s
#echo $s done
#end

