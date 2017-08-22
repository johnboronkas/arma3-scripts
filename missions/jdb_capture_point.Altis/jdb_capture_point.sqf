[] spawn {
    if (!isServer) exitWith {};

    /* Start Config Options */
    _capturePoints = [
        [
            "cp_agios_dionysios", // CP Name
            "Agios Dionysios" // CP Display name
        ],
        [
            "cp_factory",
            "Factory"
        ]
    ];

    _runIntervalSeconds = 5;
    _percentageRequiredToCap = 70;
    _percentageToBeSeen = 30;
    /* End Config Options */

    while {true} do {
        sleep _runIntervalSeconds;

        {
            _cpName = (_x select 0);
            _cpLoc = (getMarkerPos _cpName);
            _cpSize = ((getMarkerSize _cpName) select 0);
            _allCaptors = _cpLoc nearEntities ["Man", _cpSize];
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
            if (_totalCount > 0) then {
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

        } forEach _capturePoints;
    };
};
