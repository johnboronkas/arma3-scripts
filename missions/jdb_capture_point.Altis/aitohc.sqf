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
 */
if (!isServer) exitWith {};
_HC = owner "HC"; //"HC" denotes the name of the unit in-game
_HC_BLUFOR = owner "HC_BLUFOR"
waitUntil {!isNil "HC"};
waitUntil {!isNil "HC_BLUFOR"};

 ["HCS_addToHC", "onEachFrame", {
    if ((isPlayer)||(_x in units group _HC)||(_x in units group _HC_BLUFOR)) exitWith {};
    if (isNull _HC || isNull _HC_BLUFOR) ExitWith{};

    {
        if ((side _x) == west) then { _x setGroupOwner _HC_BLUFOR } else { _x setGroupOwner _HC }; //adding all units that aren't player or aren't already under HC to HC
    }forEach allUnits;

}] call BIS_fnc_addStackedEventHandler;
