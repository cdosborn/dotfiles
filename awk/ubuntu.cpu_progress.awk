BEGIN {
      # Expected to be called with -v width=n char=c

      proc="vmstat 1 5 | tail -n 5";
      while (proc | getline output) {
          n = split(output, arr);
          usage += arr[14] + arr[13]
      }
      print progress(usage / 5 / 100, width);
}
