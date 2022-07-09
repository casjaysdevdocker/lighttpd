FROM casjaysdevdocker/php:latest as lighttpd

# Setup apache and php
RUN apk -U upgrade && \
  apk --no-cache \
  add \
  lighttpd \
  lighttpd-mod_auth \
  lighttpd-mod_webdav && \
  mkdir -p /htdocs /config

COPY ./bin/entrypoint-lighttpd.sh /usr/local/bin/entrypoint-lighttpd.sh

FROM lighttpd
ARG BUILD_DATE="$(date +'%Y-%m-%d %H:%M')" 

LABEL \
  org.label-schema.name="lighttpd" \
  org.label-schema.description="lighttpd webserver with php8" \
  org.label-schema.url="https://hub.docker.com/r/casjaysdevdocker/lighttpd" \
  org.label-schema.vcs-url="https://github.com/casjaysdevdocker/lighttpd" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.version=$BUILD_DATE \
  org.label-schema.vcs-ref=$BUILD_DATE \
  org.label-schema.license="WTFPL" \
  org.label-schema.vcs-type="Git" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.vendor="CasjaysDev" \
  maintainer="CasjaysDev <docker-admin@casjaysdev.com>" 


LABEL maintainer="CasjaysDev <docker-admin@casjaysdev.com>" \
  description="Alpine based image with lighttpd and php8."

ENV PHP_SERVER=lighttpd

EXPOSE 80

WORKDIR /htdocs
VOLUME [ "/htdocs", "/config" ]

HEALTHCHECK CMD ["/usr/local/bin/entrypoint-lighttpd.sh", "healthcheck"]

ENTRYPOINT ["/usr/local/bin/entrypoint-lighttpd.sh"]
