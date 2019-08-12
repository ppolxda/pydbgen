import sys
import codecs
import string


def crlf2lf(path, encoding='utf8'):
    with codecs.open(path, 'r', encoding=encoding) as fs:
        data = fs.read()

    with codecs.open(path, 'w', encoding=encoding) as fs:
        data = data.replace('\r', '')
        fs.write(data)


def lf2crlf(path, encoding='utf8'):
    with codecs.open(path, 'r', encoding=encoding) as fs:
        data = fs.read()

    with codecs.open(path, 'w', encoding=encoding) as fs:
        data = data.replace('\r', '')
        data = data.replace('\n', '\r\n')
        fs.write(data)


def main():
    assert len(sys.argv) >= 3, 'input argv error'
    _newline = sys.argv[1]
    _path = sys.argv[2]
    _encoding = sys.argv[3] if len(sys.argv) > 4 else 'utf8'
    if _newline == 'lf':
        crlf2lf(_path, _encoding)
    elif _newline == 'crlf':
        lf2crlf(_path, _encoding)
    else:
        raise TypeError('newline invaild')


if __name__ == '__main__':
    main()
