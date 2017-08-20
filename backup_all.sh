#!/bin/bash

_arma3="C:\\Program Files (x86)\\Steam\\steamapps\\common\\Arma 3\\"
cp "$_arma3""jdb_hc.bat" ".\\server\\"
cp "$_arma3""jdb_mp.cfg" ".\\server\\"
cp "$_arma3""jdb_mp_start.bat" ".\\server\\"
cp "$_arma3""\\Users\\jdb_mp_server\\jdb_mp_server.Arma3Profile" ".\\server\\"

_missions="C:\\Users\\jd\\Documents\\Arma 3 - Other Profiles\\reth\\missions\\"
cp -r "$_missions""jdb_capture_point.Altis" ".\\missions\\"
