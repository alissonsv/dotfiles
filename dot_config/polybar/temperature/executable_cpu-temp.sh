#!/bin/sh

sensors 2>/dev/null | grep -oP '\+\K\d+(\.\d+)?' | head -n1

