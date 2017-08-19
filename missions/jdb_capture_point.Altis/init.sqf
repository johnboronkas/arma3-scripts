[] execVM "VCOMAI\init.sqf";
[] execVM "aitohc.sqf";

// Run on dedicated server
if(!hasInterface && !isDedicated) then {

 test_broadcastServerFPS = true;
 waitUntil {

   // Send the current Server FPS to every client, stored in the variable "test_serverFPS".
   test_serverFPS = diag_fps;
   publicVariable "test_serverFPS";

   sleep 1;

 !test_broadcastServerFPS
 };

} else {

 // Wait for the server to start broadcasting.
 waitUntil{!isNil "test_serverFPS"};

 test_showServerFPS = true;
 waitUntil {

   // Output the variable broadcast by the server (that stores the Server FPS) to the client.
   hint format["Server FPS: %1", test_serverFPS];

   sleep 1;

 !test_showServerFPS
 };

};
