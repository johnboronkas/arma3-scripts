[] spawn {
    if (!isServer) exitWith {};

    /* Start Config Options */
    // TODO Make this into an array and loop over it in the while true loop. One element per capture point.
    _cpName = "cp_agios_dionysios";
    _cpDisplayName = "Agios Dionysios";
    _runIntervalSeconds = 5;
    _cpName setMarkerColor "colorCivilian";
    _cpRadius = (getMarkerSize _cpName) select 0;
    _cpLoc = getMarkerPos _cpName;

    _percentageRequiredToCap = 70;
    _percentageToBeSeen = 30;
    /* End Config Options */

    while {true} do {
        sleep _runIntervalSeconds;

        _allCaptors = _cpLoc nearEntities ["Man", _cpRadius];
        _bluforCaptorsCount = 0;
        _opforCaptorsCount = 0;
        {
            switch (side _x) do {
                case west: {
                    _bluforCaptorsCount = _bluforCaptorsCount + 1;
                };

                case east: {
                    _opforCaptorsCount = _opforCaptorsCount + 1;
                };
            };
        } forEach _allCaptors;

        _totalCount = _bluforCaptorsCount + _opforCaptorsCount;
        _cpColor = getMarkerColor _cpName;

        _bluforPercentage = _bluforCaptorsCount / _totalCount;
        _bluforAbleToCap = _bluforPercentage >= _percentageRequiredToCap;
        if (_bluforAbleToCap) then {
            _cpColor = "ColorWEST";
        };

        _opforPercentage = _opforCaptorsCount / _totalCount;
        _opforAbleToCap = _opforPercentage >= _percentageRequiredToCap;
        if (_opforAbleToCap) then {
            _cpColor = "ColorEAST";
        };

        _eitherAbleToCap = _bluforAbleToCap || _opforAbleToCap;
        _bluforSeen = _bluforPercentage >= _percentageToBeSeen;
        _opforSeen = _opforPercentage >= _percentageToBeSeen;
        _battleInProgress = !_eitherAbleToCap && _bluforSeen && _opforSeen;
        if (_battleInProgress) then {
            _cpColor = "ColorUNKNOWN";
        };

        _cpName setMarkerColor _cpColor;
    };
};
