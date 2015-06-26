#! /usr/local/bin/awk -v width=15 -f

@include "progress.awk"
BEGIN {
      # Expected to be called with -v width=n char=c

      proc="top -F -R -l 1 | head -n 9";
      while((proc | getline output)) {
          split(output, arr);
          if (output ~ /^CPU/) break
      }
      close(proc);
      print progress((arr[3] + arr[5]) / 100, width);

}
