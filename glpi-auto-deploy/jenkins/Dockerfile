FROM jenkins/jenkins:lts

USER root

# Install Docker CLI and Docker Compose
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    docker.io \
    docker-compose

# Add Jenkins user to docker group
RUN usermod -aG docker jenkins

USER jenkins
