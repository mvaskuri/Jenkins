#!/bin/bash
VOLID=$(aws ec2 describe-volumes | jq -r '.Volumes[].VolumeId')
for VOL in $VOLID
do
SIZE=$(aws ec2 describe-volumes --volume-ids $VOL | jq -r '.Volumes[].Size')
if [ $SIZE -gt 1 ]
then
echo "Don't Delete $VOL size is $SIZE"
else
echo "Let's Delete $VOL size is $SIZE"
aws ec2 delete-volume --volume-id $VOL
fi
done
