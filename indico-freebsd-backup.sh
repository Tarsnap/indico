#!/bin/sh

# Backup script - version 1.0

# Get the date as epoch seconds
DATE2=$(date "+%s")

# Create sql file for indico database

pg_dump indico > /root/$DATE2-indico.sql

# Make copies of WSGI config /usr/local/www/app-uwsgi (includes /usr/local/www/app-uwsgi/indico/etc/indico.conf and /usr/local/www/app-uwsgi/indico/archive file uploads/submissions )
# celery config (in /etc/rc.conf and in the indico venv)
# nginx config, (in /usr/local/etc/nginx)

tar czvf /root/$DATE2-indico-files.tgz /etc/rc.conf /usr/local/www/app-uwsgi /usr/local/etc


# Note - when extracting things from the tarball - extract (without using -P) somewhere other than the / directory
# to avoid clobbering /etc/rc.conf and anything else by accident.

