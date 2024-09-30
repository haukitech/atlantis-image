# Customized image for Atlantis CI

This repository builds an image that extends the official Atlantis image
with necessary tools, as the official documentation suggests.

## Atlantis image version

0.30.0


## Additional tools installed to the image

| Tool       | Version     |
|------------|-------------|
| aws-cli    | 2.15.57-r0  |
| sops       | v3.9.0      |
| terragrunt | v0.67.14    |


## Versioning

We use Semver 2.0.0 to tag this image. The major and the minor versions always
match the semantic version of the upstream Atlantis image. The patch version is
used to track the version of Hauki extensions.
