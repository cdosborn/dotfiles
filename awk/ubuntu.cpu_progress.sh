#! /bin/sh
exec awk -v width=15 -f round.awk -f progress.awk -f ubuntu.cpu_progress.awk
