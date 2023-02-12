###########################################################################################
# Builder: node
###########################################################################################

FROM node:18.13.0 as builder

# Environment args
ARG PORT
ENV PORT=${PORT}
ARG ROOT_PATH
ENV ROOT_PATH=${ROOT_PATH}

# Set workdir
WORKDIR /app

# Copy source
COPY web web
COPY api api
COPY scripts scripts
COPY .nvmrc .
COPY graphql.config.js .
COPY package.json .
COPY redwood.docker.toml redwood.toml

# Install dependencies
COPY yarn.lock .
COPY .yarnrc.yml .
COPY .yarn .yarn
RUN yarn install --immutable

# Build
RUN yarn rw build api

# Clean up
RUN rm -rf ./api/src
RUN rm -rf ./web

###########################################################################################
# Runner: node
###########################################################################################

FROM node:18.13.0-bullseye-slim as runner

# Copy from builder
COPY --from=builder /app /app

# Set api as workdirectory
WORKDIR /app/api

# Entrypoint to @redwoodjs/api-server binary
ENTRYPOINT ./entrypoint.sh ${PORT} ${ROOT_PATH}
