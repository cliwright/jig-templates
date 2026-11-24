# {{.PROJECT_NAME}}

{{.DESCRIPTION}}

## Getting started

1. Install [mise](https://mise.jdx.dev) — it manages the whole toolchain
   (python, uv, opentofu, task, pre-commit, git-cliff, tflint, trivy).
2. Trust and install the pinned toolchain:

   ```sh
   mise trust && mise install
   ```

3. See the available project targets:

   ```sh
   task --list
   ```

```sh
task setup      # .venv, pre-commit hooks, tflint plugins
task test       # pytest suite (no AWS credentials needed)
task lint       # ruff + ty + tflint
task package    # build build/lambda.zip
task validate   # tofu validate (no AWS credentials needed)
```

## Deploying

Deployment is a zip-based Lambda managed by OpenTofu in `tofu/`:

```sh
task plan     # tofu plan — needs AWS credentials
task deploy   # tofu apply — needs AWS credentials
```

State stays local (`terraform.tfstate`, git-ignored) until you configure
the s3 backend in `tofu/backend.tf`. The function ships with a
least-privilege IAM role, a 14-day CloudWatch log group and active X-Ray
tracing; `task scan` (trivy) keeps the configuration honest.

## Commits and changelog

Commit messages follow [Conventional
Commits](https://www.conventionalcommits.org); the commit-msg hook checks
them. Generate the changelog with:

```sh
task changelog   # git-cliff -o CHANGELOG.md
```

## Layout

- `src/{{.PYTHON_PACKAGE}}/handler.py` — the Lambda handler
- `tests/` — the pytest suite
- `tofu/` — the OpenTofu root configuration (function, IAM, logs)
- `Taskfile.yml` — project targets (`task --list` to see them)
- `mise.toml` — pinned toolchain
- `tofu/.tflint.hcl` — tflint config (terraform recommended preset + AWS ruleset)
- `tofu/.trivyignore` — documented trivy exceptions
- `.pre-commit-config.yaml` — ruff format and tofu fmt on commit, commitizen on commit-msg
- `cliff.toml` — git-cliff changelog configuration

## Author

{{.AUTHOR}} <{{.EMAIL}}>

## License

Licensed under the {{.LICENSE}} license.
