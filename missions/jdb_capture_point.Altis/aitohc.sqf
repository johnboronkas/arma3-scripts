/*
 * aitohc.sqf
 *
 * By VCRPlayer
 *
 * This script will move ANY ai (ie: zeus-spawned, etc) to the headless client for processing on every frame
 * 
 * In init.sqf, put "[] execVM "aitohc.sqf";" (without outer quotes)
 *
 * In the description of the HeadlessClient virtual unit, put HC
 * In the second HeadlessClient, put HC_BLUFOR
 * In the third HeadlessClient, put HC_OPFOR
 */
if (!isServer) exitWith {};

diag_log format ["Waiting for !isNil blu"];
waitUntil { !isNil "HC_BLUFOR" };
diag_log format ["Waiting for !isNil op"];
waitUntil { !isNil "HC_OPFOR" };
diag_log format ["Waiting for !isNil hc"];
waitUntil { !isNil "HC" };

diag_log format ["step 2"];
_HC_BLUFOR = owner HC_BLUFOR;
diag_log format ["blu is %1", _HC_BLUFOR];
_HC_OPFOR = owner HC_OPFOR;
diag_log format ["op is %1", _HC_OPFOR];
_HC = owner HC;
diag_log format ["hc is %1", _HC];

 ["HCS_addToHC", "onEachFrame", {

    diag_log format ["checking hc blu null"];    
    if (isNull _HC_BLUFOR) exitWith {};
    diag_log format ["checking hc op null"];
    if (isNull _HC_OPFOR) exitWith {};
    diag_log format ["checking hc null"];
    if (isNull _HC) exitWith {};
    
    {
        _currentUnit = _x;
        {
            diag_log format ["current unit is %1", _currentUnit];

            if (isPlayer _currentUnit) exitWith {};
            if (_currentUnit in units group _HC_BLUFOR) exitWith {};
            if (_currentUnit in units group _HC_OPFOR) exitWith {};
            if (_currentUnit in units group _HC) exitWith {};

            diag_log format ["Adding HC controlled unit: %1", _currentUnit];

            switch (side _currentUnit) do {
                case west: { _currentUnit setGroupOwner _HC_BLUFOR };
                case east: { _currentUnit setGroupOwner _HC_OPFOR };
                default { _currentUnit setGroupOwner _HC };
            };
        };
    } forEach allUnits;
}] call BIS_fnc_addStackedEventHandler;
