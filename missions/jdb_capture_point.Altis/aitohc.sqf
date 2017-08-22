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

_HC_BLUFOR = owner "HC_BLUFOR";
_HC_OPFOR = owner "HC_OPFOR";
_HC = owner "HC";

waitUntil {!isNil "HC_BLUFOR"};
waitUntil {!isNil "HC_OPFOR"};
waitUntil {!isNil "HC"};

 ["HCS_addToHC", "onEachFrame", {
    if (isPlayer _x) exitWith {};
    if (_x in units group _HC_BLUFOR) exitWith {};
    if (_x in units group _HC_OPFOR) exitWith {};
    if (_x in units group _HC) exitWith {};
    if (isNull _HC_BLUFOR) exitWith {};
    if (isNull _HC_OPFOR) exitWith {};
    if (isNull _HC) exitWith {};
    
    {
        switch (side _x) do {
            case west: { _x setGroupOwner _HC_BLUFOR };
            case east: { _x setGroupOwner _HC_OPFOR };
            default { _x setGroupOwner _HC };
        };
    } forEach allUnits;
}] call BIS_fnc_addStackedEventHandler;
