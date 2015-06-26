BEGIN {
      # Expected to be called with -v width=n char=c

      proc="top -b -n1 | head -n 9";
      while((proc | getline output)) {
          split(output, arr);
          if (output ~ /^Cpu/) break
      }
      close(proc);
      print progress((arr[2] + arr[4]) / 100, width);

}
