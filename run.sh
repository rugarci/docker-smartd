#!/bin/sh

if test -z $MAIL_TO; then
    echo "MAIL_TO is not set"
    exit 1
fi

if test -z $SMTP_ROOT; then
    echo "SMTP_ROOT is not set"
    exit 1
fi

if test -z $SMTP_HOSTNAME; then
    export SMTP_HOSTNAME=$(hostname)
    echo "SMTP_HOSTNAME is not set, Using default: $SMTP_HOSTNAME"
fi

if test -z $SMTP_MAIL_HUB; then
    echo "SMTP_MAIL_HUB is not set"
    exit 1
fi

if test -z $SMTP_AUTH_USER; then
    echo "SMTP_AUTH_USER is not set"
    exit 1
fi

if test -z $SMTP_AUTH_PASS; then
    echo "SMTP_AUTH_PASS is not set"
    exit 1
fi

if test -z $SMARTD_DEVICE; then
    export SMARTD_DEVICE="DEVICESCAN"
    echo "SMARTD_DEVICE is not set, Using default: $SMARTD_DEVICE"
fi

if test -z $SMARTD_OPTIONS; then
    export SMARTD_OPTIONS="-n standby"
    echo "SMARTD_OPTIONS is not set, Using default: $SMARTD_OPTIONS"
fi

if test -z $MAIL_FROM; then
    echo "MAIL_FROM is not set"
else
    /usr/bin/envsubst < "/etc/ssmtp/revaliases.tmpl" > "/etc/ssmtp/revaliases"
fi

/usr/bin/envsubst < "/etc/smartd.conf.tmpl" > "/etc/smartd.conf"
/usr/bin/envsubst < "/etc/ssmtp/ssmtp.conf.tmpl" > "/etc/ssmtp/ssmtp.conf"

/usr/sbin/smartd --debug
