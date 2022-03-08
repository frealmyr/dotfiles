#!/bin/sh
git diff --numstat 2>/dev/null | awk 'NF==3 {plus+=$1; minus+=$2} END {printf("+%d/-%d\n", plus, minus)}'
