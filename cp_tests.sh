#!/bin/bash
#
# Tests basic cp functionality
#

TST_CNT=5
TST_SETUP=setup
TST_TESTFUNC=do_test
TST_CMDS="cp"
LOG_FILE="/var/log/"${TST_CMDS}".log"
TST_ROOT=$(pwd)

source common

create_tree()
{
	local dirname=$1
	local dircnt=$2
	local filecnt=$3

	LOG_WriteLog $BASH_LINENO "Creating $dircnt directories."
	LOG_WriteLog $BASH_LINENO "Filling each dir with $filecnt files".
	while [ $dircnt -gt 0 ]; do
		dirname=$dirname/dir$dircnt
	    	mkdir -p $dirname

		local fcnt=0
	        while [ $fcnt -lt $filecnt ]; do
			touch $dirname/file$fcnt
			fcnt=$((fcnt+1))
		done
		dircnt=$((dircnt-1))
	done
}

setup()
{
	create_tree "dir" 10 10
	LOG_WriteLog $BASH_LINENO docker_test > file
}

compare_dirs()
{
	local src="$1"
	local dst="$2"

	if diff -r $src $dst; then
		LOG_WriteLog $BASH_LINENO "Directories $src and $dst are equal"
	else
		LOG_WriteLog $BASH_LINENO "Directories $src and $dst differs"
		ls -R $src
		LOG_WriteLog $BASH_LINENO
		ls -R $dst
	fi
}

compare_files()
{
	local src="$1"
	local dst="$2"

	if diff $src $dst; then
		LOG_WriteLog $BASH_LINENO "Files $src and $dst are equal"
	else
		LOG_WriteLog $BASH_LINENO "Files $src and $dst differs"
	fi
}

cp_test()
{
	local args="$1"
	local src="$2"
	local dst="$3"
	cp $args $src $dst
	if [ -f $src ]; then
		compare_files $src $dst
	else
		compare_dirs $src $dst
	fi
	rm -r $dst
}

do_test()
{
	case $1 in
	1) cp_test ""  "file" "file_copy";;
	2) cp_test -l  "file" "file_copy";;
	3) cp_test -s  "file" "file_copy";;
	4) cp_test -R  "dir"  "dir_copy";;
	5) cp_test -lR "dir"  "dir_copy";;
	esac
}

run_test


