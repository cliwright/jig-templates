from {{.PYTHON_PACKAGE}}.handler import handler


def test_handler_default():
    result = handler({}, None)
    assert result["statusCode"] == 200
    assert result["body"] == "hello, world"


def test_handler_with_name():
    result = handler({"name": "lambda"}, None)
    assert result["body"] == "hello, lambda"
