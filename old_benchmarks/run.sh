#!/bin/bash

for cpu in 1 4 8 12 16; do


        for d in 1 12; do
                echo "Running ${d}detector.conf with ${cpu} CPUS..."
                cp ${d}detector.conf detector.conf
                sed -i "s/workers = /workers = ${cpu}/" detector.conf
                ~/allpix-squared/bin/allpix -c detector.conf -l ${d}detector_${cpu}cpu.log > /dev/null 2>&1

                rm -rf output
        done
done
