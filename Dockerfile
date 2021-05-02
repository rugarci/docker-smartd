FROM balenalib/armv7hf-alpine

RUN apk --update --upgrade add smartmontools ssmtp mailx gettext

COPY run.sh /run.sh
RUN chmod +x /run.sh

ADD smartd.conf.tmpl /etc/smartd.conf.tmpl
ADD ssmtp.conf.tmpl /etc/ssmtp/ssmtp.conf.tmpl

ENTRYPOINT ["./run.sh"]
