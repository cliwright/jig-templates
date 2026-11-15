from argparse import ArgumentParser, Namespace
from importlib import metadata
from types import ModuleType

from . import example

COMMANDS = [example]


def commands() -> list[ModuleType]:
    return sorted(COMMANDS, key=lambda x: x.__name__)


def parse_args() -> Namespace:
    parser = ArgumentParser()
    parser.add_argument(
        "-v",
        "--version",
        action="version",
        version=f"{{.PYTHON_PACKAGE}} - v{metadata.version('{{.PYTHON_PACKAGE}}')}",
    )

    subparsers = parser.add_subparsers(dest="command")
    subparsers.required = True

    for command in commands():
        command.configure_parser(subparsers)

    return parser.parse_args()
