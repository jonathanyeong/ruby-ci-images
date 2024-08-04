# Ruby CI images

Images for Ruby based to be used in CI. Image build for amd and arm archs.

- Based on Ruby:2.7.8-slim

To build image for multiple archs:

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/jonathanyeong/ci-ruby:2.7.8-slim .
```

To push image to ghcr:

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/jonathanyeong/ci-ruby:2.7.8-slim --push .
```