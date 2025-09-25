# Terraform + Docker + Flask — Recruiter-ready Project

This repo provisions a polished Flask web app inside Docker using Terraform.
Features:
- Responsive static frontend (landing page) + Flask backend API
- Endpoints: `/`, `/health`, `/info`, `/metrics`
- Multi-stage Dockerfile for small runtime image
- Terraform with Docker provider to build image & run container locally
- GitHub Actions workflows: Terraform validation and CI pipeline template
- Clear README, Makefile, and example `terraform.tfvars`

## Quick Start (WSL recommended)
1. Ensure Docker (Docker Desktop) and Terraform installed.
2. Clone repo and `cd` into it.
3. (Windows Git Bash users) set DOCKER host before running terraform:
   ```
   export TF_VAR_docker_host="npipe:////./pipe/docker_engine"
   ```
   or run inside WSL and keep default.

4. Initialize & apply:
   ```
   terraform init
   terraform plan -out=tfplan
   terraform apply tfplan
   ```

5. Open `http://localhost:8080` to view the landing page.
6. Destroy when done:
   ```
   terraform destroy -auto-approve
   ```

## What to show recruiters
- Live demo: run locally and open the landing page.
- Show `terraform plan` → `apply` logs and the container running.
- Point out multi-stage Dockerfile, small image size, and infra-as-code workflow.
