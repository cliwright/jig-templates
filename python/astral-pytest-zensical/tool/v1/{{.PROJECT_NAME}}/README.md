# {{.PROJECT_NAME}}

{{.DESCRIPTION}}

## Getting started

The toolchain is pinned with [mise](https://mise.jdx.dev) (`mise install`),
and project targets live in the `Taskfile.yml`:

```sh
task setup     # create .venv and install dev dependencies
task test      # run the pytest suite
task lint      # ruff check + ty type check
```

## Documentation

Docs build with [zensical](https://zensical.org) in an isolated `.docvenv`
so documentation dependencies never touch the dev environment:

```sh
task docs:serve   # build and serve the docs locally
task docs:build   # build the site into site/
```

## Layout

- `src/{{.PYTHON_PACKAGE}}/` — the package; `cli/` holds the argparse wiring
- `tests/` — the pytest suite
- `docs/` — the zensical documentation site
- `Taskfile.yml` — project targets (`task --list` to see them)
- `mise.toml` — pinned toolchain (python, uv, go-task)

## License

Licensed under the {{.LICENSE}} license (see `pyproject.toml`).
