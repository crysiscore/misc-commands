#!/bin/bash

declare -a sites=( "1_junho" "1_maio" "albasine" "altomae" "bagamoio" "catembe" "chamanculo" "cimento" "hcm_ped" "hpi" "hulene" "incassane" "inhaca" "inhagoia" "josemacamo_cs" "josemacamo_hg" "magoanine_a" "magoanine_tenda" "malhangalene" "mavalane_cs" "mavalane_hg_a" "mavalane_hg_p" "maxaquene" "pescadores" "polana_canico" "porto" "romao" "xipamanine" "zimpeto" )
# Group us_names by strlength
declare -a group5=( "romao" "porto" )
declare -a group6=( "1_maio" "hulene" "inhaca" )
declare -a group7=( "1_junho" "altomae" "catembe" "cimento" "hcm_ped" "zimpeto" )
declare -a group8=( "inhagoia" "bagamoio" "albasine" )
declare -a group9=( "maxaquene" "incassane")
declare -a group10=( "xipamanine" "pescadores" "chamanculo" )
declare -a group11=( "mavalane_cs" "magoanine_a" )
declare -a group12=( "malhangalene" )
declare -a group13=( "polana_canico" "mavalane_hg_p" "mavalane_hg_a" "josemacamo_hg" "josemacamo_cs" )
declare -a group14=( "magoanine_tenda" )

# OpenMRS central server url
openmrs_base_url="  |  https://mail.ccsaude.org.mz:5458/"

# Clear text 
echo "+-----------------+-------------+---------------------------------------------------+"  > openmrs_sync.txt
echo "| U. Sanitaria    |  Ult Backup | OpenMRS Link                                      |"  >> openmrs_sync.txt 
echo "+-----------------+-------------+---------------------------------------------------+"  >> openmrs_sync.txt
#for each dir  get last uploaded file and extract  backup date
# and append info  to file
for us in ${sites[@]}; do

  cd $us
  # get last uploaded backup
  var=$(ls -Art|tail -n 1)
  # append backup date and openmrs url
  var1="${var:${#var}-14:10}$openmrs_base_url$us"
 
# print to file
  if [[ " ${group5[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"           |  "$var1"            |"  >> ../openmrs_sync.txt
  elif [[ " ${group6[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"          |  "$var1"           |"   >> ../openmrs_sync.txt
  elif [[ " ${group7[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"         |  "$var1"          |"   >> ../openmrs_sync.txt
  elif [[ " ${group8[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"        |  "$var1"         |"    >> ../openmrs_sync.txt
  elif [[ " ${group9[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"       |  "$var1"        |"     >> ../openmrs_sync.txt
  elif [[ " ${group10[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"      |  "$var1"       |"     >> ../openmrs_sync.txt
  elif [[ " ${group11[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"     |  "$var1"      |"     >> ../openmrs_sync.txt
  elif [[ " ${group12[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"    |  "$var1"     |"     >> ../openmrs_sync.txt
  elif [[ " ${group13[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us"   |  "$var1"    |"    >> ../openmrs_sync.txt
  elif [[ " ${group14[*]} " =~ " ${us} " ]]; then
    # whatever you want to do when array contains value
    echo "| "$us" |  "$var1"  |"    >> ../openmrs_sync.txt
  else 
     # whatever you want to do when array contains value
    echo "| "$us"             |  "$var1"              |" >> ../openmrs_sync.txt
fi
  #echo $str

  cd .. 
  
done
echo "+-----------------------------------------------------------------------------------+" >> openmrs_sync.txt
cat  openmrs_sync.txt


# send to cloud
# Microsoft power automate will notify M&E group mail 

rclone  sync  -P --verbose --retries 5 openmrs_sync.txt  onedrive:/power_automate/openmrs/sync_status
