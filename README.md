PROTOCOL FOR RESTING STATE ANALYSES using C-PAC

Online documentation is here: http://fcp-indi.github.io/docs/user/index.html

in order to look at the GUI (graphical user interface) of the CPAC software in terminal type: cpac_gui
*NOTE: if that does not work, make sure the module cpac is loaded

files needed:
-config.yml : file of all the setting for the resting state analyses
-subject_list.yml : file of all the paths to the subject data (anatomical and resting state)

location of scripts:
-/home3/kensinel/fMRI_DATA/SleepLDF/scripts/CPAC_scripts

steps to run resting_state analyses for SLEEPLDF

1. After niftis are created for the resting state scans run: ./move_files_for_CPAC.sh

2. After all files are moved then cd into one of the resting state analysis folders (i.e. /home3/kensinel/fMRI_DATA/SleepLDF/pre_ret_resting_state)

3. Within this folder create a subject list with the subjects you want to run through the resting state preprocessing script. You can use the CPAC_subject_list_retrieval_template.yml as a template. Replace all the ? in the file with the subject numbers. IF you want to do this programmatically see the CPAC manual.

4. In a node cd into the particular resting state directory you want to run and type: cpac_run.py pipeline_config_REST.yml CPAC_subject_list.yml. Make sure to type the name of the subject list you just created in the step above. To run one participant on a node it takes at least 3 hours

**QA steps

5. Check the number of time points in the .nii.gz after scrubbing the data (removing time points with too much movement and the time points around it). Run ./num_tp_scrubbed.sh

6. Run ./ROI_analysis.sh 









