SUBDIRS=$(shell ls -l | grep ^d | awk '{print $$9}')
ROOT_DIR=$(shell pwd)


.PHONY: test

test:
	for dir in $(SUBDIRS); \
	do \
            if [ -f $$dir'/Makefile' ]; then \
 	        $(MAKE) -C $$dir test; \
            fi \
	done
