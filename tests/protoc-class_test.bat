pipenv run python -u -m pydbgen.protoc -I./ --custom_out=./ --plugin=protoc-gen-custom=.\tests\protoc-class_bin.bat ./tests/tick.proto
pipenv run python -u -m pydbgen.protoc -I./ --python_out=./ ./tests/tick.proto
pipenv run python -u -m pydbgen.protoc -I./ --python_out=./ ./tests/tickbb.proto
