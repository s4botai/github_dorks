#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function helpPanel() {
  echo -e "\n${redColour}[!] Github Dorks to find sensitive info from a target! (Original Script from Jason Haddix)${endColour}"
  for i in $(seq 1 90); do echo -e -ne "${redColour}-"; done; echo -ne "${endColour}"
    echo -e "\n\n\t${grayColour}[-t]${endColour} ${yellowColour}Target domain (Example: dell.com)${endColour}"
  echo -e "\n\t${grayColour}[-h]${endColour} ${yellowColour}Show this help panel${endColour}\n" 

}

function echoDorks() {
  without_suffix=`echo -e $target|cut -d . -f1`
  echo -e ""
  echo -e "${blueColour}************ Github Dork Links (must be logged in) *******************${endColour}"
  search_entries=(
  "password"
  "npmrc _auth"
  "dockercfg"
  "pem private"
  "id_rsa"
  "aws_access_key_id"
  "s3cfg"
  "htpasswd"
  "git-credentials"
  "bashrc password"
  "sshd_config"
  "xoxp OR xoxb OR xoxa"
  "SECRET_KEY"
  "client_secret"
  "github_token"
  "api_key"
  "FTP"
  "app_secret"
  "passwd"
  "s3.yml"
  ".env"
  ".exs"
  "beanstalkd.yml"
  "deploy.rake"
  "mysql"
  "credentials"
  "PWD"
  ".bash_history"
  ".sls"
  "secrets"
  "composer.json"
  )

  for entry in "${search_entries[@]}"; do
    echo -e "\n${yellowColour} ${endColour} ${grayColour}Search for ${entry}${endColour}"
    echo -e "${turquoiseColour}https://github.com/search?q=%22$target%22+${entry// /%20}&type=Code${endColour}"
    echo -e "${turquoiseColour}https://github.com/search?q=%22$without_suffix%22+${entry// /%20}&type=Code${endColour}"
  done

}


while getopts "t:h" arg; do

  case $arg in
    t) target=$OPTARG; let parameter_counter+=2;;
    h) helpPanel; let parameter_counter+=1;;

  esac

done


if [[ parameter_counter -eq 0 ]]; then

  helpPanel

elif [[ parameter_counter -eq 2 ]]; then

  echoDorks

fi
