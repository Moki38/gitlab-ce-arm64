FROM debian:bullseye
#ORIGINAL MAINTAINER Sytse Sijbrandij
MAINTAINER Eric van Dijken

# Install required packages
RUN apt-get update -q \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
      ca-certificates \
      openssh-server \
      wget \
      curl \
      sudo \
      apt-transport-https \
      vim \
      nano

# Download & Install GitLab
# If you run GitLab Enterprise Edition point it to a location where you have downloaded it.
RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash

RUN apt-get update && apt-get install -yq --no-install-recommends gitlab-ce

# Manage SSHD through runit
RUN mkdir -p /opt/gitlab/sv/sshd/supervise \
    && mkfifo /opt/gitlab/sv/sshd/supervise/ok \
    && printf "#!/bin/sh\nexec 2>&1\numask 077\nexec /usr/sbin/sshd -D" > /opt/gitlab/sv/sshd/run \
    && chmod a+x /opt/gitlab/sv/sshd/run \
    && ln -s /opt/gitlab/sv/sshd /opt/gitlab/service \
    && mkdir -p /var/run/sshd

# Disabling use DNS in ssh since it tends to slow connecting
RUN echo "UseDNS no" >> /etc/ssh/sshd_config

# Prepare default configuration
RUN ( \
  echo "" && \
  echo "# Docker options" && \
  echo "# Prevent Postgres from trying to allocate 25% of total memory" && \
  echo "postgresql['shared_buffers'] = '1MB'" ) >> /etc/gitlab/gitlab.rb && \
  mkdir -p /assets/ && \
  cp /etc/gitlab/gitlab.rb /assets/gitlab.rb

# Expose web & ssh
EXPOSE 443 80 22

# Define data volumes
VOLUME ["/etc/gitlab", "/var/opt/gitlab", "/var/log/gitlab"]

# Copy assets
#COPY assets/wrapper /usr/local/bin/

# Wrapper to handle signal, trigger runit and reconfigure GitLab
#CMD ["/usr/local/bin/wrapper"]
