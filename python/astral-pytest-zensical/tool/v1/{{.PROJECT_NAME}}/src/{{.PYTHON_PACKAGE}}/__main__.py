from {{.PYTHON_PACKAGE}}.cli import parse_args


def main() -> int:
    args = parse_args()
    return args.func(args)


if __name__ == "__main__":
    exit(main())
