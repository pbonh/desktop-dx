#!/usr/bin/env just --justfile

hello:
  echo "Hello World!"

sign_key:
  cosign generate-key-pair
  gh secret set SIGNING_SECRET < cosign.key
