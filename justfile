#!/usr/bin/env just --justfile

hello:
  echo "Hello World!"

sign_key:
  cosign generate-key-pair
  gh secret set SIGNING_SECRET < cosign.key

generate_iso iso_output_directory="iso-output":
  mkdir -p ./{{ iso_output_directory }}
  sudo podman run --rm --privileged --volume ./{{ iso_output_directory }}:/build-container-installer/build --security-opt label=disable --pull=newer \
  ghcr.io/jasonn3/build-container-installer:latest \
  IMAGE_REPO=ghcr.io/octocat \
  IMAGE_NAME=weird-os \
  IMAGE_TAG=latest \
  VARIANT=Silverblue # should match the variant your image is based on
