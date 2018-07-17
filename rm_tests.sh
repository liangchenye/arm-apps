#!/bin/bash

TST_CNT=4
TST_SETUP=setup
TST_TESTFUNC=do_test
TST_CMDS="rm"
LOG_FILE="/var/log/"${TST_CMDS}".log"
TST_ROOT=$(pwd)

source common

setup()
{
    touch "demoFile"
    mkdir "demoDir"
}

rm_test()
{
    local rm_opt=$1
    local rm_file=$2

    local rm_cmd="rm $rm_opt $rm_file"

    eval $rm_cmd > temp 2>&1
    if [ $? -ne 0 ]; then
        grep -q -E "unknown option|invalid option" temp
        if [ $? -eq 0 ]; then
            LOG_WriteLog $BASH_LINENO "$rm_cmd not supported."
        else
            LOG_WriteLog $BASH_LINENO "$rm_cmd failed."
        fi
        return
    fi

    if [ -z $rm_opt ];then
        if [ -f $rm_file ];then
            LOG_WriteLog $BASH_LINENO "$rm_cmd failed."
            return
        fi
    else
        if [ $rm_opt = "-r" ];then
            if [ -d $rm_file ];then
                LOG_WriteLog $BASH_LINENO "$rm_cmd failed."
                return
            fi
        fi
    fi

    LOG_WriteLog $BASH_LINENO "rm passed with $rm_opt option." 
}

do_test()
{
    case $1 in
        1) rm_test "" "demoFile";;
        2) rm_test "-r" "demoDir";;
        3) rm_test "--help";;
        4) rm_test "--version";;
    esac
}

run_test

