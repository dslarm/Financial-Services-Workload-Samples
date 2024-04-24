SUBDIRS := BinomialOptions BlackScholes AsianOptionsPricing LiborMarketModel MonteCarloAmericanOptions MonteCarloEuropeanOptions


subdirs:
	for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir ; \
	  done

clean:
	for dir in $(SUBDIRS); do \
	  $(MAKE) -C $$dir clean ; \
	  done
