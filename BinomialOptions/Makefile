#Copyright (c) Intel Corporation 2019-2020

#Intel Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#!/bin/bash

include ../Makefile.include

arch := $(shell uname -m)
ifeq ($(arch),x86_64)
CXX=icpc
CXXFLAGS=-O3 -g -restrict -fimf-domain-exclusion=31 -fimf-accuracy-bits=11 -no-prec-div -no-prec-sqrt -fno-alias -qopt-report=5 -qopt-report-phase=vec -fopenmp
LDFLAGS=-lpthread -ltbbmalloc
else
ifeq ($(arch),arm64)
CXXFLAGS=-L/opt/homebrew/opt/libomp/lib -I/opt/homebrew/opt/libomp/include -lomp -Xclang -fopenmp   -I /opt/homebrew/opt/tbb/include -L /opt/homebrew/opt/tbb/lib -Wc++11-inline-namespace 
CXX=clang++
else
CXX=g++
CXXFLAGS=-O3 -fopenmp -g
endif
endif
all: binomial

binomial: binomial_cpu.cpp binomial_main.cpp binomial.h
	$(CXX) -std=c++14 $(CXXFLAGS) -o $@ $(LDFLAGS) binomial_main.cpp binomial_cpu.cpp  -ltbb


clean	:
	rm -f binomial
