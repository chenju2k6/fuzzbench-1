#!/bin/bash -ex
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cd libjpeg-turbo
make clean
make distclean
autoreconf -fiv
./configure --disable-shared
make -j $(nproc)

#$CXX $CXXFLAGS -std=c++11 $SRC/libjpeg_turbo_fuzzer.cc -I . \
#    .libs/libturbojpeg.a  -o $OUT/libjpeg_turbo_fuzzer_vani

$CC $CFLAGS  /buildScript/libjpeg-turbo-07-2017/libjpeg_turbo_fuzzer.c .libs/libturbojpeg.a /buildScript/standaloneengine.c -I .  \
    -o $OUT/libjpeg_turbo_fuzzer_vani
