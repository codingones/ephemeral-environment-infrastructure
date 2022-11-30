# CodingOnes Ephemeral Environment Infrastructure

## About

Ephemeral Environment Infrastructure deploy an AWS ephemeral environment used in the context of a feature branch IAC organisation.

> This repository is NOT required for local development.

## Table of contents

- 🪧 [About](#about)
- 🛠️ [Usage](#usage)
- 🙌 [Contributing](#contributing)
- 📝 [Licence](#licence)

## Usage

There is no specific usage for this repository as it is used internally by a GitHub action :  
This repository is cloned by the action [Create Terraform Cloud Workspace for AWS ephemeral environment](https://github.com/codingones/github-actions-workflows/blob/main/.github/workflows/create-terraform-cloud-workspace-for-aws-ephemeral-environment.terraform.yml) in a
git GitHub CI, then the infrastructure is provisioned, ready to host the ephemeral environment.

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) file in this repository.

## Licence

See [LICENSE.md](./LICENSE.md) file in this repository.
