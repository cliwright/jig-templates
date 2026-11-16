# Security Policy

## Reporting a vulnerability

Please report vulnerabilities **privately** to **jesse@cliwright.dev** —
not as a public GitHub issue. That includes templates in this repo doing
something they shouldn't: unexpected network access in generated files,
malicious content hidden in a template, or a template abusing a jig
renderer weakness.

## Scope

Templates here are inert data rendered by
[jig](https://github.com/cliwright/jig) — nothing executes at render time.
Issues with jig's renderer itself (containment, symlink handling, and
friends) belong to the jig repo; anything about the *content* of these
templates belongs here.
