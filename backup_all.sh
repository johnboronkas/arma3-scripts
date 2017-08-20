#!/bin/bash

_arma3="C:\\Program Files (x86)\\Steam\\steamapps\\common\\Arma 3\\"
cp "$_arma3""jdb_hc.bat" ".\\server\\"
cp "$_arma3""jdb_mp.cfg" ".\\server\\"
cp "$_arma3""jdb_mp_start.bat" ".\\server\\"

_profiles="C:\\Users\\jd\\Documents\\Arma 3 - Other Profiles\\"
cp "$_profiles""jdb_mp_server\\jdb_mp_server.Arma3Profile" ".\\server\\"

cp -r "$_profiles""reth\\missions\\jdb_capture_point.Altis" ".\\missions\\"
