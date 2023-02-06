#!/bin/bash
aws --version
i=1
for vol in {$i -le 3}
do
aws ec2 create-volume \
--volume-type gp2 \
--size 1 \
--availability-zone us-east-1a
echo "created Volume $i"
sleep 2
done
