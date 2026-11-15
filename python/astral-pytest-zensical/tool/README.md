# python/astral-pytest-zensical/tool

A python CLI tool on the [astral](https://astral.sh) toolchain: uv for
dependency management, hatchling for builds, pytest for tests, ruff for
linting, ty for type checking, and [zensical](https://zensical.org) for
documentation. Project targets run through go-task (`Taskfile.yml`); the
toolchain pins with mise (`mise.toml`).

## Render

```sh
jig render --template python/astral-pytest-zensical/tool --output ./tools
```

## Variables

| Variable | Default | Notes |
| --- | --- | --- |
| `PROJECT_NAME` | `my-project` | Lowercase, hyphens; names the project directory |
| `PYTHON_PACKAGE` | derived from `PROJECT_NAME` (`-` → `_`) | Importable package name under `src/` |
| `COMMAND_NAME` | derived from `PROJECT_NAME` | CLI entrypoint in `[project.scripts]` |
| `DESCRIPTION` | `A python cli tool` | One sentence |
| `AUTHOR` | `John Doe` | First and last name |
| `EMAIL` | `john.doe@example.com` | Author email |
| `LICENSE` | `MIT` | One of `MIT`, `Apache-2.0` |

Overriding `PROJECT_NAME` re-derives `PYTHON_PACKAGE` and `COMMAND_NAME`
automatically — one answer covers all three unless you say otherwise.

## After rendering

```sh
cd <project>
mise install
task setup && task test
```
