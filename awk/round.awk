function round(decimal, _integral) {
    _integral = int(decimal);
    if (decimal - _integral >= 0.5)
        return _integral + 1
    return _integral
}
