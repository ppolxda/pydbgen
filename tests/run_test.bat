@echo off
pipenv run python setup.py install
pipenv run python -m pydbgen.protoc -I./ --custom_out=./examples/out --plugin=protoc-gen-custom=pdb_json ./examples/database_example.proto
pipenv run python -m pydbgen.protoc -I./ --custom_out=./examples/out --plugin=protoc-gen-custom=pdb_mongodb ./examples/database_example.proto
pipenv run python -m pydbgen.protoc -I./ --custom_out=./examples/out --plugin=protoc-gen-custom=pdb_mysql ./examples/database_example.proto
pipenv run python -m pydbgen.protoc -I./ --custom_out=./examples/out --plugin=protoc-gen-custom=pdb_pgsql ./examples/database_example.proto
