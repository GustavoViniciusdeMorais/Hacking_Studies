#!/bin/bash
read -p "IP:" gusip
read -p "Ports:" gusports
echo -e "\e[32m"

if [ -z "$gusip" ];then
    gusip="localhost"
fi
if [ -z "$gusports" ];then
    gusports="21,22,80"
fi

nmap -v -sV -T5 -p $gusports $gusip
tree .
echo -e "\e[0m" # reset

#host="localhost";
#ports="22,21,80";
#if [ -n "$1" ];then
#    host=$1;
#fi
#if [ -n "$2" ];then
#    ports=$2;
#fi
#nmap -v -sV -T5 -p $ports $host
