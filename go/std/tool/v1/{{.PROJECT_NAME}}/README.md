# {{.PROJECT_NAME}}

{{.DESCRIPTION}}

## Getting started

1. Install [mise](https://mise.jdx.dev) — it manages the whole toolchain
   (go, task, pre-commit, git-cliff).
2. Trust and install the pinned toolchain:

   ```sh
   mise trust && mise install
   ```

3. See the available project targets:

   ```sh
   task --list
   ```

```sh
task setup     # install the pre-commit hooks
task test      # run the test suite
task lint      # go vet
task build     # build the binary into bin/
```

## Commits and changelog

Commit messages follow [Conventional
Commits](https://www.conventionalcommits.org); the commit-msg hook checks
them. Generate the changelog with:

```sh
task changelog   # git-cliff -o CHANGELOG.md
```

## Layout

- `cmd/{{.PROJECT_NAME}}/` — the CLI entrypoint (stdlib `flag` only)
- `Taskfile.yml` — project targets (`task --list` to see them)
- `mise.toml` — pinned toolchain (go, task, pre-commit, git-cliff)
- `.pre-commit-config.yaml` — gofmt on commit, commitizen on commit-msg
- `cliff.toml` — git-cliff changelog configuration

## Author

{{.AUTHOR}} <{{.EMAIL}}>

## License

Licensed under the {{.LICENSE}} license.
