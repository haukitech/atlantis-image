# Customized image for Atlantis CI

This repository builds an image that extends the official Atlantis image
with necessary tools, as the official documentation suggests.

## Atlantis image version

0.29.0


## Additional tools installed to the image

| Tool       | Version  |
|------------|----------|
| opentofu   | v1.8.2   |
| terragrunt | v0.67.11 |
| sops       | v3.9.0   |


## Versioning

We use Semver 2.0.0 to tag this image. The major and the minor versions always
match the semantic version of the upstream Atlantis image. The patch version is
used to track the version of Hauki extensions.
