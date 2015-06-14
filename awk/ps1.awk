NR == 1 {
    user = substr($0, 0, 4);
}
NR == 4 {
    ls = $0
}
NR == 2 {
    FS = "."
    patsplit($0, arr, /..../)
    host = arr[1];
}
NR == 3 {
    n = split($0, arr, "/")
    dir = arr[n] "/"
}

END {
    if (user == "root") {
        symb = "#"
    } else {
        symb = "●"
    }
    sep = "■"
    # print sep user sep host sep dir symb " "
    system("tput cup 0 0; tput el; tput el1")
    system("ls | xargs")
    system("tput cup 1 0; tput el; tput el1;")
    print dir symb " "
}
