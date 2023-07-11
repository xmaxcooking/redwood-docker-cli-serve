# Deploying RedwoodJS with Docker

Welcome to the RedwoodJS with Docker deployment example repository!

This repository serves as an example for deploying a RedwoodJS application using Docker. The provided Dockerfiles and docker-compose configuration files aim to simplify the process of containerizing your RedwoodJS application.

## Prerequisites

- Redwood requires Node.js (>=18.x) and Yarn (>=1.15)
- Docker installed on your system
- Repository Structure

The repository contains the following key Docker-related files in both the api and web directories:

- Dockerfile: The Docker configuration file for building the Docker image.
- docker-compose.yml: Docker Compose configuration for orchestrating your Docker containers.
- entrypoint.sh: Script that runs on container startup. Notably, for the api container, it handles running the database migrations.

## Getting Started

Clone the repository and navigate into the project directory:

```bash
git clone https://github.com/xmaxcooking/redwood-docker-cli-serve.git
cd your_repository
```

Building the Docker images can be done using the provided script in package.json:

```bash
yarn docker-build
```

This script is essentially a wrapper around Docker Compose and sets up the necessary Docker containers for both the web and API services.

## Notes

- The api container automatically runs database migrations at startup via the entrypoint.sh script.
- The global Yarn cache is disabled to speed up local Docker build times.
- The Dockerfiles provided are not optimized for space. They will copy almost everything from your project into the Docker image. The RedwoodJS team has formed a working group to tackle this optimization and other necessary changes to improve the Docker experience and deployments.
- If the api service is behind a proxy, some changes may be necessary in the app configuration.
- The entrypoint.sh script uses arguments to handle Redwood's configuration limitations regarding environment-agnostic variables, such as ports, hosts, and URLs. The Redwood CLI command yarn rw serve has an apiHost argument to circumvent these limitations.
