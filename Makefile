SUBDIRS := BinomialOptions BlackScholes


subdirs:
	for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir ; \
	  done
