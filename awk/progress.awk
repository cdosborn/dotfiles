@include "round.awk"
function progress(ratio, _width, _c, _ticks, _integral, _scaled, _bangs, _pad, _i) {
    if (!_width) _width = 10;
    if (!_c) _c = ".";

    _integral = round(ratio * 100);
    _scaled = (_width - 2) * ratio;
    _ticks = round(_scaled);
    while (_i++ < _ticks)
        _bangs = _bangs _c

    _pad = _width - 2 - _ticks
    if (_pad > 3)
        _integral = _integral "%"
    else
        _integral = ""
    return sprintf("[%s%" _pad "s]", _bangs, _integral);
}
