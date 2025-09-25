init:
	terraform init

fmt:
	terraform fmt -recursive

plan:
	terraform plan -out=tfplan

apply:
	terraform apply tfplan

destroy:
	terraform destroy -auto-approve
