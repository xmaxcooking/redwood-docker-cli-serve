###########################################################################################
# Builder: node
###########################################################################################

FROM node:18.13.0 as builder

# Environment args
ARG PORT
ENV PORT=${PORT}
ARG API_HOST
ENV API_HOST=${API_HOST}

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
RUN yarn rw build web

# Clean up
RUN rm -rf ./web/src
RUN rm -rf ./api/

###########################################################################################
# Runner: node
###########################################################################################

FROM node:18.13.0-bullseye-slim as runner

# Copy from builder
COPY --from=builder /app /app

# Set web as workdirectory
WORKDIR /app/web

# Entrypoint to @redwoodjs/web-server binary
ENTRYPOINT ./entrypoint.sh ${PORT} ${API_HOST}
