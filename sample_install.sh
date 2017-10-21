#!/bin/bash
echo ":::: convert payload ::::"
xbin -c payload.sh
sleep 1
shc -f payload
xbin -l payload
echo "done."
