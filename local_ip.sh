#! /bin/bash

# The purpose of this script is to retrieve the local Public IP of host machine
# and store it in a variable. This variable will be used later in the script

local_ip=$(curl -s ipinfo.io/ip)
echo "{\"ip\": \"$local_ip\"}"  # This is to convert IP into JSON format so Terraform can use it