 
# This is my private GitLab-CE container build (linux/arm64/aarch64/RPI), YMMV
Couldn't find the release i was looking for, so i build it myself.

**Pull this build version**:
```
docker pull moki38/gitlab-ce
```
 
**Sources**: 
- https://hub.docker.com/r/gitlab/gitlab-ce/dockerfile/
- https://hub.docker.com/r/ravermeister/gitlab
- https://packages.gitlab.com/app/gitlab/gitlab-ce/search?page=16&q=arm64
- https://gitlab.com/gitlab-org/omnibus-gitlab/-/blob/master/doc/build/build_docker_image.md

**Usage**: 
- https://docs.gitlab.com/ee/install/docker.html

# gitlab-ce-arm64 (ARM64)

## Build container image
```
docker build -t moki38/gitlab-ce:latest -t moki38/gitlab-ce:v15.7.2 github.com/Moki38/gitlab-ce-arm64
or
podman build -t moki38/gitlab-ce:latest -t moki38/gitlab-ce:v15.7.2 github.com/Moki38/gitlab-ce-arm64
````

## Push to docker.io (only if you are me).
```
docker image push moki38/gitlab-ce:latest
docker image push moki38/gitlab-ce:v15.7.2
or
podman image push moki38/gitlab-ce:latest
podman image push moki38/gitlab-ce:v15.7.2
```
