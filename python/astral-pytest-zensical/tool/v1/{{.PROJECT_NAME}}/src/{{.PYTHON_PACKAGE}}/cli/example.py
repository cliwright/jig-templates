from argparse import Namespace, RawDescriptionHelpFormatter
from typing import Any

cmd_help = "Help for command"
cmd_description = """
More help description here
"""


def configure_parser(subparser: Any) -> None:
    example_parser = subparser.add_parser(
        name="example",
        help=cmd_help,
        description=cmd_description,
        formatter_class=RawDescriptionHelpFormatter,
    )
    example_parser.set_defaults(func=entrypoint)

    example_parser.add_argument(
        "--flag",
        type=str,
        help="some value",
        required=False,
        default="",
    )


def entrypoint(cliargs: Namespace) -> int:
    print("example entrypoint")
    print(cliargs)
    return 0
