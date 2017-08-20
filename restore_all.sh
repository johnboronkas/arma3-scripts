#!/bin/bash

_arma3="C:\\Program Files (x86)\\Steam\\steamapps\\common\\Arma 3\\"
cp .\\server\\jdb_hc.bat "$_arma3"
cp .\\server\\jdb_mp.cfg "$_arma3"
cp .\\server\\jdb_mp_start.bat "$_arma3"
cp .\\server\\jdb_mp_server.Arma3Profile "$_arma3""\\Users\\jdb_mp_server\\"

_profiles="C:\\Users\\jd\\Documents\\Arma 3 - Other Profiles\\"
cp ".\\server\\""jdb_mp_server.Arma3Profile" "$_profiles""jdb_mp_server\\"

cp -r ".\\missions\\""jdb_capture_point.Altis" "$_profiles""reth\\missions\\"
