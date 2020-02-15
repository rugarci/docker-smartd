#!/bin/bash

if [[ ! -v MAIL_TO ]]; then
    echo "MAIL_TO is not set"
    exit 1
fi

if [[ ! -v SMTP_ROOT ]]; then
    echo "SMTP_ROOT is not set"
    exit 1
fi

if [[ ! -v SMTP_HOSTNAME ]]; then
    echo "SMTP_HOSTNAME is not set"
    exit 1
fi

if [[ ! -v SMTP_MAIL_HUB ]]; then
    echo "SMTP_MAIL_HUB is not set"
    exit 1
fi

if [[ ! -v SMTP_AUTH_USER ]]; then
    echo "SMTP_AUTH_USER is not set"
    exit 1
fi

if [[ ! -v SMTP_AUTH_PASS ]]; then
    echo "SMTP_AUTH_PASS is not set"
    exit 1
fi

if [[ ! -v SMARTD_OPTIONS ]]; then
    SMARTD_OPTIONS=
fi

envsubst < "/etc/smartd.conf.tmpl" > "/etc/smartd.conf"
envsubst < "/etc/ssmtp/ssmtp.conf.tmpl" > "/etc/ssmtp/ssmtp.conf"

cat /etc/smartd.conf

/usr/sbin/smartd --debug
