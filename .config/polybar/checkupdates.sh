#!/usr/bin/sh

update_count=$(checkupdates+aur | wc -l)
if [ $update_count -gt 0 ]
then
    printf "%s %s\n" $update_count "Updates available"
fi
