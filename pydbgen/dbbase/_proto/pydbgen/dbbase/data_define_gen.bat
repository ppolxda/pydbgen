@echo off
protoc -I%~sdp0../../ --python_out=%~sdp0../../../../../ pydbgen/dbbase/data_define.proto
