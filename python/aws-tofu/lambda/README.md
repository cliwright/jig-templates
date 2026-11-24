# python/aws-tofu/lambda

A python AWS Lambda function deployed with [OpenTofu](https://opentofu.org):
a zip-packaged handler (uv, hatchling, pytest, ruff, ty on the python
side) plus a self-contained OpenTofu root configuration in `tofu/`
(function, least-privilege IAM role, CloudWatch log group, X-Ray
tracing). tflint with the AWS ruleset and trivy config scanning keep the
infrastructure honest. Project targets run through go-task
(`Taskfile.yml`); the toolchain pins with mise (`mise.toml`). Pre-commit
runs the formatters and enforces conventional commits; changelogs
generate with git-cliff.

## Render

```sh
jig render --template python/aws-tofu/lambda --output ./lambdas
```

## Variables

| Variable | Default | Notes |
| --- | --- | --- |
| `PROJECT_NAME` | `my-lambda` | Lowercase, hyphens; also the Lambda function name |
| `PYTHON_PACKAGE` | derived from `PROJECT_NAME` (`-` → `_`) | Importable package under `src/`, sets the tofu handler |
| `AWS_REGION` | `eu-central-1` | Default deploy region (overridable per-run in tofu) |
| `DESCRIPTION` | `A python AWS lambda deployed with OpenTofu` | One sentence |
| `AUTHOR` | `John Doe` | First and last name |
| `EMAIL` | `john.doe@example.com` | Author email |
| `LICENSE` | `MIT` | One of `MIT`, `Apache-2.0` |

Overriding `PROJECT_NAME` re-derives `PYTHON_PACKAGE` automatically.

## After rendering

```sh
cd <project>
mise trust && mise install
task setup && task test && task validate
```

`task plan` / `task deploy` need real AWS credentials; state stays local
until the s3 backend in `tofu/backend.tf` is configured.
