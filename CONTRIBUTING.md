# Contributing to Taxi Tribe Infrastructure Admin

## Table of contents

- 📦 [Prerequisites](#prerequisites)
- 🚀 [Installation](#installation)
- 🛠️ [Local usage for development](#local-usage-for-development)
- 🤝 [Requirements](#requirements)
- 🏗️ [Built with](#built-with)

## Prerequisites

- [Docker](https://www.docker.com/) or [Terraform CLI](https://www.terraform.io/cli)

## Installation

The following command allows to use the Terraform command line via Docker:
```shell
docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light
```

For simplified use, you can create an alias:
```shell
alias terraform='docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light'
```

Using this alias, there is no longer any difference between a terraform command executed via Docker or via Terraform CLI.

## Local usage for development

### Check and fix `.tf` files format

```shell
terraform fmt
```

### Verify ressources consistency

```shell
terraform validate
```

### Retrieve Terraform Cloud authentication token locally

```shell
terraform login
```

### Initialize state and plugins locally

```shell
terraform init
```

### Plan a run to check differences between the current and the next infrastructure state to be deployed

```shell
terraform plan
```

### Apply the next state of the infrastructure

```shell
terraform apply
```

## Requirements

### Branches naming rules

- Must be up-to-date with main (rebased, linear history)
- Must be prefixed with follow the `build/`, `chore/`, `ci/`, `docs/`, `feat/`, `fix/`, `perf/`, `refactor/`, `revert/`, `style/` or `test/` according to their content. See [Conventional Commits cheat sheet](https://kapeli.com/cheat_sheets/Conventional_Commits.docset/Contents/Resources/Documents/index)

### Commits rules

#### Format

Must follow conventional commits specification: [Commits Conventionnels](https://www.conventionalcommits.org/fr)

#### Verified

Commits must be verified: [About commit signature verification](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)

#### Continuous integration check

[//]: # (Todo)
All validation checks in workflow `Validate Terraform` must pass without failure

## Built with

### Langages & Frameworks

- [Terraform](https://www.terraform.io/) is an infrastructure as code software tool that allow to define and provide infrastructure using a declarative configuration language
  - [terraform provider](https://registry.terraform.io/providers/hashicorp/tfe): is a Terraform provider used to read and write to/from Terrafrom Cloud (workspaces, variables, etc.)
