@echo off
protoc -I%~sdp0 -I%~sdp0.. --python_out=%~sdp0../../../ %~sdp0/data_define.proto
