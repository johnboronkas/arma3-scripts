#!/bin/bash

_arma3="C:\\Program Files (x86)\\Steam\\steamapps\\common\\Arma 3\\"
cp .\\server\\jdb_hc.bat "$_arma3"
cp .\\server\\jdb_mp.cfg "$_arma3"
cp .\\server\\jdb_mp_start.bat "$_arma3"

_missions="C:\\Users\\jd\\Documents\\Arma 3 - Other Profiles\\reth\\missions\\"
cp -r ".\\missions\\""jdb_capture_point.Altis" "$_missions"
