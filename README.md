 
# This is my private build, YMMV
 
Sources: https://hub.docker.com/r/gitlab/gitlab-ce/dockerfile/
         https://hub.docker.com/r/ravermeister/gitlab

# gitlab-ce-arm64 (Debian Bullseye ARM64)

# Build docker image
docker build -t moki38/gitlab-ce:latest -t moki38/gitlab-ce:v15.5.7 github.com/Moki38/gitlab-ce-arm64


# Push to docker.io
docker image push moki38/gitlab-ce:latest

docker image push moki38/gitlab-ce:v15.5.7

