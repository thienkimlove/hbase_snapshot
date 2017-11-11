#!/bin/bash
date_format=$1
time_format=$2
echo "time need to export : " ${date_format} ${time_format}
string_date="${date_format} ${time_format}";
unix_time=$(date -d ${string_date} +"%s")
echo "Unix Time :" ${unix_time}