#!/bin/bash
sudo apt update
sudo apt install -y td-agent-bit

cat > /etc/td-agent-bit/td-agent-bit.conf <<EOF
[INPUT]
    Name              tail
    Path              /var/log/syslog
    Parser            json
    Tag               syslog

[OUTPUT]
    Name  es
    Match *
    Host  <ELK_SERVER_IP>
    Port  9200
    Index fluentbit
    Type  _doc
    Logstash_Format On
EOF

sudo systemctl restart td-agent-bit
