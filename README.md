# jig-templates

Community project templates for [jig](https://jig.cliwright.dev) — the
scaffolder with no hooks and no template-supplied code execution.

## Use them

```sh
git clone https://github.com/cliwright/jig-templates ~/jig-templates
export JIG_TEMPLATES_DIR="$HOME/jig-templates"

jig render --template python/astral-pytest-zensical/tool --output ./tools
```

Pin a tag for reproducibility (`git -C "$JIG_TEMPLATES_DIR" checkout v1.0.0`),
update with `git pull`. New to jig? Run `jig agents` or see
[jig.cliwright.dev](https://jig.cliwright.dev).

## Layout and conventions

Templates are addressed `<language>/<flavor>/<kind>/v<N>`:

```
python/astral-pytest-zensical/tool/v1/{{.PROJECT_NAME}}/jig.json
```

- **flavor names encode the toolchain bundle.** jig templates are static
  file trees — names and contents render, but the file *set* never changes.
  Structural variation (different test runner, different docs tool) means a
  different flavor, never a variable. Content variation (license, author)
  is what variables and `choices` are for.
- **versions are immutable directories.** Breaking layout changes mean a
  new `v<N>` (made with `jig bump`); renders pin theirs with `--version`,
  latest wins by default.
- **CI workflows and other `${{ }}` files** ship in a `verbatim` directory
  when static, or use `{{ ldelim }}`/`{{ rdelim }}` when they need a few
  jig variables — see
  [the docs](https://jig.cliwright.dev/implementation/).

## Templates

| Template | What it renders |
| --- | --- |
| [`python/astral-pytest-zensical/tool`](python/astral-pytest-zensical/tool/) | Python CLI on the astral toolchain (uv, hatchling, pytest, ruff, ty) with zensical docs, Taskfile targets, mise-pinned toolchain |
| [`python/astral-pytest-zensical/lib`](python/astral-pytest-zensical/lib/) | Publishable Python library on the same toolchain, with `build`/`publish` PyPI targets instead of CLI wiring |

## Contributing

Templates are data — no hooks, no scripts, nothing that executes at render
time, by design. Contributions are ordinary PRs:

1. Scaffold with `jig new <language>/<flavor>/<kind> --templates-dir .` or
  copy an existing template.
2. Every template must pass `jig check --template <name> --templates-dir .`.
3. Include a `README.md` next to the version directories (see the existing
  templates) documenting what it renders and its variables.
4. Never edit an existing `v<N>` in a breaking way — `jig bump` to the next
  version instead.

## License

[MIT](LICENSE)
