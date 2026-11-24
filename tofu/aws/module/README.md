# tofu/aws/module

A reusable [OpenTofu](https://opentofu.org) module for AWS — the
`main.tf` / `variables.tf` / `outputs.tf` / `versions.tf` skeleton with a
validated `examples/complete` caller, tflint (terraform recommended
preset + AWS ruleset), trivy config scanning, and terraform-docs
README generation. Project targets run through go-task (`Taskfile.yml`);
the toolchain pins with mise (`mise.toml`). Pre-commit runs `tofu fmt`
and enforces conventional commits; changelogs generate with git-cliff.

## Render

```sh
jig render --template tofu/aws/module --output ./modules
```

## Variables

| Variable | Default | Notes |
| --- | --- | --- |
| `PROJECT_NAME` | `my-module` | Lowercase, hyphens; names the module directory |
| `DESCRIPTION` | `An OpenTofu AWS module` | One sentence |
| `AUTHOR` | `John Doe` | First and last name; also used in the README usage example |
| `EMAIL` | `john.doe@example.com` | Author email |
| `LICENSE` | `MIT` | One of `MIT`, `Apache-2.0` |

## After rendering

```sh
cd <module>
mise trust && mise install
task setup && task validate
```

`task validate` downloads the AWS provider from the registry — it needs
network access but no cloud credentials.
