#!/bin/bash

. /root/.bashrc

if [ $# -eq 0 ]; then
    echo "Please provide the action to take (serve|enter)"
    exit
fi

action=$1
command_options=$2

case "${action}" in
     enter)
         sleep infinity
         ;;

     serve)
         frankenphp="${PWD}/frankenphp"
         if [ ! -f "${frankenphp}" ]; then
             a octane:install --server=frankenphp
         fi

         a octane:frankenphp "${command_options}"
         ;;

    *)
        printf "[ERROR] Unsupported action ${action}\n"
        exit
        ;;
esac
