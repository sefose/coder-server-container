ARG UBUNTU_VERSION
FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && apt-get -y upgrade && apt-get install --no-install-recommends -y \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# install code-server
# RUN curl -fsSL https://code-server.dev/install.sh | sh
ARG VSC_VERSION
RUN curl -fOL https://github.com/cdr/code-server/releases/download/v${VSC_VERSION}/code-server_${VSC_VERSION}_amd64.deb && \
    dpkg -i code-server_${VSC_VERSION}_amd64.deb && \
    rm code-server_${VSC_VERSION}_amd64.deb