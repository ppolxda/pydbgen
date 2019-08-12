set DB_TMLP=.\examples\code_tmpl
set DB_CONFIG={tmpl}/gen_code.json
pipenv run python -u -m pydbgen.protoc -I./ --custom_out=./examples/out --plugin=protoc-gen-custom=.\tests\protoc-code_bin.bat ./examples/database_example.proto
