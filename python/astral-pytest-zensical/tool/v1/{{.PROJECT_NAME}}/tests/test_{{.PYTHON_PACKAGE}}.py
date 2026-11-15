import sys

from {{.PYTHON_PACKAGE}}.cli import parse_args


def test_example_command_parses():
    sys.argv = ["{{.COMMAND_NAME}}", "example", "--flag", "x"]
    args = parse_args()
    assert args.flag == "x"
