# Pandoc Image
FROM geoffh1977/alpine:latest
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

ENV PANDOC_VERSION=2.7

# Install Pandoc
RUN wget -O "/tmp/pandoc-${PANDOC_VERSION}-linux.tar.gz" "https://github.com/jgm/pandoc/releases/download/${PANDOC_VERSION}/pandoc-${PANDOC_VERSION}-linux.tar.gz" && \
  tar -xzf "/tmp/pandoc-${PANDOC_VERSION}-linux.tar.gz" -C /tmp && \
  cp /tmp/pandoc-${PANDOC_VERSION}/bin/* /usr/bin/ && \
  mkdir -p /input /output && \
  chown "${ALPINE_USER}":"${ALPINE_USER}" -R /input /output && \
  rm -rf "/tmp/pandoc-${PANDOC_VERSION}/" "/tmp/pandoc-${PANDOC_VERSION}-linux.tar.gz"

USER ${ALPINE_USER}
WORKDIR /input
VOLUME /input /output
CMD ["/usr/bin/pandoc"]
