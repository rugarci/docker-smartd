# docker-smartd

[![Docker Pulls](https://img.shields.io/docker/pulls/rugarci/smartd.svg)](https://hub.docker.com/r/rugarci/smartd/) 

S.M.A.R.T mail alerts with Docker

Tested on Raspberry Pi 3 

## Usage

```bash
docker run --privileged -e MAIL_TO=yyyyyyy@gmail.com -e SMTP_ROOT=xxxxxx@gmail.com -e SMTP_HOSTNAME=smartd -e SMTP_MAIL_HUB=smtp.gmail.com:587 -e SMTP_AUTH_USER=xxxxxxx@gmail.com -e SMTP_AUTH_PASS=xxxxxxxx rugarci/smartd
```

For Docker compose

```yaml
  smartd:
    image: rugarci/smartd
    environment:
      - MAIL_TO=yyyyyyy@gmail.com
      - SMTP_ROOT=xxxxxx@gmail.com
      - SMTP_HOSTNAME=smartd
      - SMTP_MAIL_HUB=smtp.gmail.com:587
      - SMTP_AUTH_USER=xxxxxxx@gmail.com 
      - SMTP_AUTH_PASS=xxxxxxxx 
    privileged: true
```
