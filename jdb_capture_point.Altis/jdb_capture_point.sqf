[] spawn {
    _cpName = "cp";
    _cpDisplayName = "Agios Dionysios";
    _numUnitsRequired = 4;
    _runIntervalSeconds = 5;
    _cpName setMarkerColor "colorCivilian";

    _cpRadius = (getMarkerSize _cpName) select 0;
    _cpLoc = getMarkerPos _cpName;

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

        _cpColor = getMarkerColor _cpName;
        if (_bluforCaptorsCount >= _numUnitsRequired && _opforCaptorsCount >= _numUnitsRequired) then {
            _cpColor = "ColorUNKNOWN";
            hint format ["Battle started at %1", _cpDisplayName];
        } else {
            if (_bluforCaptorsCount > _numUnitsRequired) then {
                _cpColor = "ColorWEST";
                hint format ["Blufor captured %1", _cpDisplayName];
            };

            if (_opforCaptorsCount > _numUnitsRequired) then {
                _cpColor = "ColorEAST";
                hint format ["Opfor captured %1", _cpDisplayName];
            };
        };
        _cpName setMarkerColor _cpColor;
    };
};
