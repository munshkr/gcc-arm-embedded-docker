# gcc-arm-embedded-docker

Debian-based image that includes Arm Embedded toolchain for cross-compilation,
gcc and cmake.

Tested with the [Daisy Seed](https://github.com/electro-smith/libDaisy) platform.

## Example

### Gitlab CI

`.gitlab-ci.yml`

```yml
image: "munshkr/gcc-arm-embedded:10-2020q4"

build:
  stage: build

  script:
    - make -j

  artifacts:
    paths:
      - "*.bin"
    expire_in: 30 days
```
