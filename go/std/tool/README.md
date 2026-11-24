# go/std/tool

A Go CLI tool on the standard library toolchain — no third-party Go
dependencies, just `flag` for argument parsing. Project targets run
through go-task (`Taskfile.yml`); the toolchain pins with mise
(`mise.toml`: go, task, pre-commit, git-cliff). Pre-commit runs gofmt and
enforces conventional commits; changelogs generate with git-cliff
(`cliff.toml`).

## Render

```sh
jig render --template go/std/tool --output ./tools
```

## Variables

| Variable | Default | Notes |
| --- | --- | --- |
| `PROJECT_NAME` | `my-project` | Lowercase, hyphens; names the project directory and the binary |
| `GO_MODULE` | `github.com/example/<PROJECT_NAME>` | Go module path in `go.mod` |
| `DESCRIPTION` | `A go cli tool` | One sentence |
| `AUTHOR` | `John Doe` | First and last name |
| `EMAIL` | `john.doe@example.com` | Author email |
| `LICENSE` | `MIT` | One of `MIT`, `Apache-2.0` |

Overriding `PROJECT_NAME` re-derives `GO_MODULE` automatically.

## After rendering

```sh
cd <project>
mise trust && mise install
task setup && task test
```
