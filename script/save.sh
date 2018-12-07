#!/bin/sh

# Enable Power Saving on Intel HDA Audio
echo "

options snd_hda_intel power_save=1

" > /etc/modprobe.d/60-snd_hda_intel.conf


# Experimental options to improve power saving on Intel Graphics
echo "

options i915 enable_rc6=1 enable_fbc=1 lvds_downclock=1

" > /etc/modprobe.d/60-i915.conf
