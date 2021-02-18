# Notes

## Resources

- [Course 14min](https://www.youtube.com/watch?v=OXE2a8dqIAI)
- [DevOpsDirective YT](https://www.youtube.com/c/DevOpsDirective)

## Docker Part

### Running mongo in container

Download and run mongodb in the background (**-d**) and forward port from container 27017 to local 27017.
_Mongo connection string will be mongodb://localhost:27017/storybooks when running api locally._

```
docker run -p 27017:27017 -d mongo:3.6-xenial
```

### Important files

- [.dockerignore](./.dockerignore) - ignore files/directories while working with docker (eg. - node_modules entry)
- [Dockerfile](./Dockerfile) - container configuration, low lvl
- [docker-componse.yml](./docker-componse.yml) - compose more than one containers (Dockerfiles), higher lvl

When running mongo with docker-compose, host name 'localhost' becomes service name specified in docker-compose file, in this case its 'mongo-db', so connection string becomes '...mongo-db:27017/storybooks'

### Other interesting Docker commands

```
# Print running containers.
docker ps

# Print all containers.
docker ps -a

# Remove container
docker container rm <id>

# Start container
docker container start <id>

# Stop container
docker container stop <id>

# Print all images
docker images

# Remove image
docker image rm <id>

# Run compose, use -d for detached mode
docker-compose up

# Stop compose
docker-compose down
```

## Services / Utils

- [Makefile](https://opensource.com/article/18/8/what-how-makefile) is used to store commands and run them in commands shell later so we don't have to remember them.
- [gsutil](https://cloud.google.com/storage/docs/gsutil) is a Python application that lets you access Cloud Storage from the command line. You can use gsutil to do a wide range of bucket and object management tasks.

## Google Developer Console

[google developer console](https://console.developers.google.com/apis/dashboard?folder=&organizationId=&project=sandbox-305213)

- OAuth 2.0 Client IDs - needed google authentication.
- Service Account - accounts used for granting permission to external services, eg. grat bucket write permission to terraform.
- Buckets (created with gsutil) - are used for storing data

## Terraform

It is a common practice to point for applications to point to the service account credentials in env variable. Also remember to add this file to .dockerignore and .gitignore.

```
terraform init # in directory with main.tf and credentials file.
```

```
export GOOGLE_APPLICATION_CREDENTIALS=$PWD/terraform-sa-key.json
# /home/jacob/Projects/devops-course-storybooks/terraform/terraform-sa-key.json
```

# StoryBooks

> Create public and private stories from your life

This app uses Node.js/Express/MongoDB with Google OAuth for authentication

## Usage

Add your mongoDB URI and Google OAuth credentials to the config.env file

```
# Install dependencies
npm install

# Run in development
npm run dev

# Run in production
npm start
```
