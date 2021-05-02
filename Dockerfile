FROM alpine:3

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF
ARG ARCH

RUN echo "I'm ${ARCH}"

LABEL org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="docker-smartd" \
    org.label-schema.version=$VERSION \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/rugarci/docker-smartd" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.schema-version="1.0"
    
RUN apk --update --upgrade add smartmontools ssmtp mailx gettext

COPY run.sh /run.sh
RUN chmod +x /run.sh

ADD smartd.conf.tmpl /etc/smartd.conf.tmpl
ADD ssmtp.conf.tmpl /etc/ssmtp/ssmtp.conf.tmpl

ENTRYPOINT ["./run.sh"]
