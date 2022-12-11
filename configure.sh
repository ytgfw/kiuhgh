#!/bin/sh

#tor &
/v2ray  run -config=/config.json &
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile

cat << EOF > /etc/v2ray/config.json
{
    "inbounds": [{
        "port": 8080,
        "protocol": "vmess",
        "settings": {
            "clients": [{
                "id": "1e1d66be-435c-49e2-bd07-fd2865293b23",
                "alterId": 0
            }]
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "/fdfdhac"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

#Run V2ray

/usr/bin/v2ray/v2ray  run -config=/etc/v2ray/config.json
