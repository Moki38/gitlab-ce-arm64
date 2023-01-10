 
# This is my private build, YMMV
 
**Sources**: https://hub.docker.com/r/gitlab/gitlab-ce/dockerfile/
         https://hub.docker.com/r/ravermeister/gitlab
         https://packages.gitlab.com/app/gitlab/gitlab-ce/search?page=16&q=arm64

**Usage**: https://docs.gitlab.com/ee/install/docker.html

# gitlab-ce-arm64 (ARM64)

## Build docker image
```
docker build -t moki38/gitlab-ce:latest -t moki38/gitlab-ce:v15.7.2 github.com/Moki38/gitlab-ce-arm64
````

## Push to docker.io
```
docker image push moki38/gitlab-ce:latest
docker image push moki38/gitlab-ce:v15.7.2
```
