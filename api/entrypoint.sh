#!/bin/sh

PORT="${1}"
ROOT_PATH="${2}"

yarn rw prisma migrate deploy --schema ./api/db/schema.prisma

if [ -z "$PORT" ] && [ -z "$ROOT_PATH" ]; then
  yarn rw serve api
elif [ -z "$PORT" ]; then
  yarn rw serve api --rootPath $ROOT_PATH
elif [ -z "$ROOT_PATH" ]; then
  yarn rw serve api --port $PORT
else
  yarn rw serve api --port $PORT --rootPath $ROOT_PATH
fi
