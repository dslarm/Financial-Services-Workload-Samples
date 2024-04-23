#Copyright (c) Intel Corporation 2019-2020

#Intel Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#!/bin/bash

arch := $(shell uname -m)
ifeq ($(arch),x86_64)
CXX=icpc
COMMON_FLAGS= -std=c++14 -fimf-precision=low -no-prec-div -no-prec-sqrt -vecabi=cmdtarget -qopt-report=5 -qopt-report-phase=vec  -Wall -mkl -qopt-zmm-usage=high -fimf-domain-exclusion=31 -fno-alias -qopt-assume-safe-padding -restrict -Bstatic -Wl,--start-group -lmkl_intel_ilp64 -lmkl_sequential -lmkl_core -Wl,--end-group -Bdynamic -lpthread
CXXFLAGS=-O3 -g $COMMON_FLAGS
LDFLAGS=-lpthread -ltbbmalloc
else
ifeq ($(arch),arm64)
CXXFLAGS=-L/opt/homebrew/opt/libomp/lib -I/opt/homebrew/opt/libomp/include -lomp -Xclang -fopenmp   -I /opt/homebrew/opt/tbb/include -L /opt/homebrew/opt/tbb/lib -Wc++11-inline-namespace  -I /opt/arm/armpl_24.04_flang-new_clang_18/include -L /opt/arm/armpl_24.04_flang-new_clang_18/lib -larmpl
CXX=clang++
else
CXX=g++
CXXFLAGS=-O3 -fopenmp -g
endif
endif
all: liborgreeks

liborgreeks: 
	$(CXX) -std=c++14 $(CXXFLAGS) -o $@ $(LDFLAGS) main.cpp liborSwaptionGreeks.cpp mklRng.cpp -ltbb


clean	:
	rm -f binomial
