// TODO Make settings into an array, and for each array, run the common while loop.
// TODO Figure out better UI than hints.

// TODO (in other script) Spawn trucks for each owned CP. If truck gets there, holds for x seconds,
// then returns to base, earn y zeus points.

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
