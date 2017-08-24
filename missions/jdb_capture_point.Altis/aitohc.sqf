/*
 * aitohc.sqf
 *
 * By VCRPlayer
 * Modified by reth
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

waitUntil { !isNil "HC_BLUFOR" };
waitUntil { !isNil "HC_OPFOR" };
waitUntil { !isNil "HC" };

_HC_BLUFOR = owner HC_BLUFOR;
_HC_OPFOR = owner HC_OPFOR;
_HC = owner HC;

 ["HCS_addToHC", "onEachFrame", {

    if (isNull _HC_BLUFOR) exitWith {};
    if (isNull _HC_OPFOR) exitWith {};
    if (isNull _HC) exitWith {};
    
    {
        if (!isPlayer _x) then {
            diag_log format ["current unit is %1", _x];
            if (!(_x in units group _HC_BLUFOR)) then {
                diag_log format ["current unit not in blu!"];
                if (!(_x in units group _HC_OPFOR)) then {
                    diag_log format ["current unit not in op!"];
                    if (!(_x in units group _HC)) then {
                        diag_log format ["current unit not in hc!"];

                        switch (side _x) do {
                            case west: { _x setOwner _HC_BLUFOR };
                            case east: { _x setOwner _HC_OPFOR };
                            default { _x setOwner _HC };
                        };
                    }
                }
            }
        }
    } forEach allUnits;
}] call BIS_fnc_addStackedEventHandler;
