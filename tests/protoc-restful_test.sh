pipenv run python -u -m pydbgen.protoc -I./ --custom_out=./ --plugin=protoc-gen-custom=tests/protoc-restful_bin.sh ./examples/rest_client.proto
