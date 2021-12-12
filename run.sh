#!/bin/sh

# Default values
true ${SMARTD_DEVICE:=DEVICESCAN}

if test -z $MAIL_TO; then
    echo "$MAIL_TO is not set"
    exit 1
fi

if test -z $SMTP_ROOT; then
    echo "$SMTP_ROOT is not set"
    exit 1
fi

if test -z $SMTP_HOSTNAME; then
    echo "$SMTP_HOSTNAME is not set"
    exit 1
fi

if test -z $SMTP_MAIL_HUB; then
    echo "$SMTP_MAIL_HUB is not set"
    exit 1
fi

if test -z $SMTP_AUTH_USER; then
    echo "$SMTP_AUTH_USER is not set"
    exit 1
fi

if test -z $SMTP_AUTH_PASS; then
    echo "$SMTP_AUTH_PASS is not set"
    exit 1
fi

if test -z $SMARTD_OPTIONS; then
    SMARTD_OPTIONS="-n standby"
fi

if test -z $MAIL_FROM; then
    echo "MAIL_FROM is not set"
else
    /usr/bin/envsubst < "/etc/ssmtp/revaliases.tmpl" > "/etc/ssmtp/revaliases"
fi

/usr/bin/envsubst < "/etc/smartd.conf.tmpl" > "/etc/smartd.conf"
/usr/bin/envsubst < "/etc/ssmtp/ssmtp.conf.tmpl" > "/etc/ssmtp/ssmtp.conf"

/usr/sbin/smartd --debug
