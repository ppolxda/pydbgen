pipenv run python -u -m pydbgen.protoc -I./ --custom_out=./examples/out --plugin=protoc-gen-custom=.\tests\protoc-gen_bin.bat ./examples/database_example.proto
