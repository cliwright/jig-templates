# Contributing to jig-templates

New templates and template improvements are welcome as ordinary pull
requests: **fork the repo, push a branch to your fork, and open a PR back
against `main`.** CI runs `jig check` on every version of every template
on each PR (first-time contributors' runs need a maintainer to approve
them once — after that they're automatic).

Templates are data — no hooks, no scripts, nothing that executes at render
time, by design. Keep them that way.

## Conventions

1. Scaffold with `jig new <language>/<flavor>/<kind> --templates-dir .` or
   copy an existing template.
2. Every template must pass `jig check --template <name> --templates-dir .`
   — CI enforces this.
3. Include a `README.md` next to the version directories (see the existing
   templates) documenting what the template renders and its variables.
4. Never edit an existing `v<N>` in a breaking way — `jig bump` to the
   next version instead. Old versions stay renderable.

## License

By contributing, you agree that your contributions are licensed under the
[Apache License 2.0](LICENSE).
