#!/bin/bash

# Check Gatekeeper Status


osvers=$(sw_vers -productVersion | awk -F. '{print $2}')

if [[ ${osvers} -lt 7 ]]; then
  echo "Gatekeeper Not Available For This Version Of Mac OS X"
fi
 
# Checks Gatekeeper status on Macs
# running 10.7.x or higher

if [[ ${osvers} -ge 7 ]]; then
    gatekeeper_status=`spctl --status | grep "assessments" | cut -c13-`
   if [ $gatekeeper_status = "disabled" ]; then
      result=Disabled
   else
      result=Active
   fi
   echo $result
fi