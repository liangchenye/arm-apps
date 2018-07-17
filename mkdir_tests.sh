#!/bin/bash
#
# Basic mkdir tests
#
TST_CNT=3
TST_SETUP=setup
TST_TESTFUNC=do_test
TST_CMDS="mkdir"
LOG_FILE="/var/log/"${TST_CMDS}".log"
TST_ROOT=$(pwd)

source common

setup()
{
	mkdir "dir"
	LONG_PATH="some/long/path/of/several/directories"
}

test1()
{
	mkdir "dir" 2> mkdir.out

	if grep -q "dir.*File exists" mkdir.out; then
		LOG_WriteLog $BASH_LINENO "Got correct error message"
	else
		LOG_WriteLog $BASH_LINENO  "Got wrong error message"
		cat mkdir.out
	fi
}

test2()
{
	mkdir "$LONG_PATH" 2> mkdir.out

	if grep -q "$LONG_PATH.*No such file or directory" mkdir.out; then
		LOG_WriteLog $BASH_LINENO "Got correct error message"
	else
		LOG_WriteLog $BASH_LINENO "Got wrong error message"
		cat mkdir.out
	fi

	rm -rf "$LONG_PATH"
}

test3()
{
	mkdir -p "$LONG_PATH"

	rm -rf "$LONG_PATH"
}

do_test()
{
	test$1
}

run_test


