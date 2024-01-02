# gcc-arm-embedded-docker

Debian-based image that includes Arm Embedded toolchain for cross-compilation,
gcc and cmake.

## Example

### Gitlab CI

`.gitlab-ci.yml`

```yml
image: "munshkr/gcc-arm-embedded:10-2020q4"

build:
  stage: build

  script:
    - make

  artifacts:
    paths:
      - "*.bin"
    expire_in: 30 days
```
