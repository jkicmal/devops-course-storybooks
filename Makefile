PROJECT_ID=sandbox-305213
ENV = staging

run-local:
	docker-compose up

###

# Create Google Cloud Storage with gsutil to store State File
create-tf-backend-bucket:
	gsutil mb -p $(PROJECT_ID) gs://$(PROJECT_ID)-terraform

###

# Create terraform workspace
terraform-create-workspace:
	cd terraform &&\
	terraform workspace new $(ENV)

terraform-init:
	cd terraform &&\
	terraform workspace select $(ENV) &&\
	terraform init