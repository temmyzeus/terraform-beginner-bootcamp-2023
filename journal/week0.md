# Terraform Beginner Bootcamp 2023 - Week 0

- [Semantic Versioning 2.0.0!!!](#semantic-versioning-200---)
- [Summary](#summary)
  * [Introduction](#introduction)
  * [Changes](#changes)
  * [Terraform Cloud](#terraform-cloud)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>



## Semantic Versioning 2.0.0!!!
## Summary
Given a version number `MAJOR.MINOR.PATCH`, increment the:

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes
Additional labels for pre-release and build metadata are available as extensions to the ~~MAJOR.MINOR.PATCH~~ format.

### Introduction
In the world of software management there exists a dreaded place called ***dependency hell.*** The bigger your system grows and the more packages you integrate into your software, the more likely you are to find yourself, one day, in this pit of despair.

### Changes

Terraform installation command was revised to go with terraform doc [here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli#install-terraform) . This was done because of changes in the `gpg keyring`.

Gitpod tasks `init` command was changed to `before`, since the `init` only runs when a new workspace is created but `before` allows to run everytime the workspace is started. Check [here](https://www.gitpod.io/docs/configure/workspaces/tasks#execution-order) for reference.

Also the terraform installation command was saved to a bash [file](./bin/install_terraform_cli) and the file was run from the [.gitpod.yml file](./.gitpod.yml). Executable permission was added to the `user permission` for bash file to enable us to run it.

```bash
chmod u+7 <file-name>
```

Exampe Environment variable [file](.env.example) was added to show sample of environment variables needed to be added when setting up the environment.

###  Terraform Cloud
1. Login to Terraform using `terraform login`. \
This bring us a WYSIWYG (What you see is what you get) prompt which helps to login to terraform cloud via the browser.
2. An API Token is generated which is stored in local location `~/.terraform.d/credentials.tfrc/json` in the json format

```json
{
  "credentials": {
    // The key is the hostname which can be changed in case of a local deployment of terraform
    "app.terraform.io": {
      "token": "<GENERATED TOKEN>"
    }
  }
}
```
3. Run `terraform plan` & `terrafotm apply` to deploy your resources.

Note: Terraform pushes files in the instantiated directory to remote and runs the `plan` or `apply` remotely. This means variables stored in our local enviroment or in local files outside of the terraform init / apply directory will not be found by terraform .
To tackle this, we used Terraform cloud variables which also has an environment variable options. This variables has `TF_VAR` prepended to them to be picked up by terraform.