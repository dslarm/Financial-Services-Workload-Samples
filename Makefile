SUBDIRS := BinomialOptions BlackScholes

$(SUBDIRS):
	$(MAKE) -C $@
