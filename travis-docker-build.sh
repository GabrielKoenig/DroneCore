#!/bin/bash

set -e

make BUILD_TYPE=Debug run_unit_tests -j4
make install
make docs
make fix_style
(cd example/takeoff_land && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make)
(cd example/fly_mission && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make)
(cd example/offboard_velocity && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make)
make clean

make BUILD_TYPE=Release run_unit_tests -j4
make install
make docs
make fix_style
(cd example/takeoff_land && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make)
(cd example/fly_mission && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make)
(cd example/offboard_velocity && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make)
make clean