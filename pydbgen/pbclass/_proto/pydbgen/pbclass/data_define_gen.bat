@echo off
protoc -I%~sdp0../../ --python_out=%~sdp0../../../../../ pydbgen/pbclass/data_define.proto
