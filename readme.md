# Quick Start Terraform 🚀

## Overview ✨
Launch AWS environments fast with a curated Terraform stack that stitches together IAM, S3, networking, Lambda, and Glue primitives—so you can build on top instead of rebuilding the basics.

## What's Inside 🧰
- **IAM module**: opinionated roles and policies to unlock Lambda and Glue access safely.
- **S3 module**: artifact buckets for code packages, job scripts, and temp data.
- **Networking module**: ready-to-go VPC pieces with public subnetting and security guardrails.
- **Lambda module**: deployable compute wired to the IAM role, S3 bucket, and network perimeter.
- **Glue module**: analytics job baseline with logging, retries, and concurrency controls.

## Prerequisites ✅
- **Terraform CLI** `>= 1.5.0`
- **AWS credentials** with a `lab` profile (or tweak `provider.aws.profile`)
- **Node/Git optional** if you want to script deployments or use Git hooks

## Setup Guide 🛠️
1. **Clone** the repo and step inside: `git clone ... && cd quick-start-terraform`.
2. **Adjust defaults** in `terraform.tfvars` to reflect your region, bucket names, and CIDR ranges.
3. **(Optional) Configure backend** if you want remote state before initializing.
4. **Install providers**: `terraform init`.
5. **Check the blueprint**: `terraform plan` to confirm resource counts, names, and policies.
6. **Ship it**: `terraform apply` and approve the plan to create your foundation.
7. **Iterate**: customize modules or add new ones once the base is working.

## Configuration Cheat Sheet 📒
- **`main_config`**: controls AWS region targeting and base tagging.
- **`basic_sg_config`**: defines security group naming, ingress, and egress patterns.
- **`basic_internet_config`**: wires internet gateways and routes.
- **`lambda_config`**: layers runtime selection on top of generated IAM and S3 inputs.
- **`s3_config`**: provides bucket names for Lambda packages and Glue artifacts.
- **`glue_config`**: toggles runtime, temp directories, log destinations, and job execution limits.

## Project Layout 🗂️
- **`main.tf`**: orchestrates module wiring and dependencies.
- **`variables.tf`**: declares the strongly typed input objects.
- **`terraform.tfvars`**: editable example values to get you rolling.
- **Module directories** (`iam/`, `s3/`, `networking/`, `lambda/`, `glue/`): isolated Terraform logic for each building block.

## Maintenance Tips 🧹
- **Refresh often** with `terraform plan` to preview drift or pending tweaks.
- **Roll back cleanly** using `terraform destroy` when tearing down lab environments.
- **Version lock** providers and modules to keep reproducibility high.

Happy provisioning! 🌈
