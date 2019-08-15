#!/bin/bash

for cpu in $(seq 1 3 40); do
        for d in 1 4 12; do
                echo "Running ${d}detector.conf with ${cpu} CPUS..."
                cp ${d}detector.conf detector.conf
                sed -i "s/workers = /workers = ${cpu}/" detector.conf
		        /afs/cern.ch/user/m/momali/allpix-squared/bin/allpix -c detector.conf  > ${d}detector_${cpu}cpu.log 2>&1

                rm -rf output
        done
done

