#!/usr/bin/env bash

if [ -n $LOGENTRIES_TOKEN ]
then

cat <<RSYSLOGCONF > /etc/rsyslog.d/logentries.conf
\$template Logentries,"$LOGENTRIES_TOKEN %HOSTNAME% %syslogtag%%msg%\\n"
*.* @@data.logentries.com:80;Logentries
RSYSLOGCONF

service rsyslog restart

fi

# delete old server.pid
rm -f /app/tmp/pids/server.pid

# start up nginx in the background
nginx &

bundle exec rake db:migrate && bundle exec unicorn_rails -p $PORT -c config/unicorn.rb
