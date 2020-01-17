@echo off
pipenv run python setup.py install

pipenv run where pydbgen
pipenv run where protoc-gen-pydbjson
pipenv run where protoc-gen-pydbmysql
pipenv run where protoc-gen-pydbpgsql
pipenv run where protoc-gen-pydbmongo

pipenv run pydbgen -I./ --pydbjson_out=./examples/out ./examples/database_example.proto
pipenv run pydbgen -I./ --pydbmysql_out=./examples/out ./examples/database_example.proto
pipenv run pydbgen -I./ --pydbpgsql_out=./examples/out ./examples/database_example.proto
pipenv run pydbgen -I./ --pydbmongo_out=./examples/out ./examples/database_example.proto
