Before creating infrastructure, run `terraform plan` to check what will be created/changed/destroyed.

Infrastructure can be created by using `terraform apply`.

Provisioning instances can be performed by using a `provisioner` node within a `resource`.

Variables can be included using `.tf` files, but can also be provided as flags
when using the command line (`-var`), as variable-only files `terraform.tfvars` or `*.auto.tfvars` (`-var-file`) and as environment variables (`TF_VAR_name`).

Variables which are lists can be defined as arrays: `["10.0.0.0/16", "10.1.0.0/16"]`. Similarly, we can have maps: 

```terraform
{
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
}
```

Terrafor supports search in maps via `lookup`: 

```terraform
output "ami" {
  value = "${lookup(var.amis, var.region)}"
}
```

The `output` keyword will show data from resources back to the user after a `apply` or `refresh` command. Outputs can also be queried: `terraform output ip`.

Instead of reinventing the wheel for common and complex infrastructure setups, we can leverage from community `modules` stored at the Terraform Registry. To use them, we just place the module in our `.tf` file and run `terraform init` to install these dependencies. After that, creating the infrastructure is just like before: `terraform apply`.