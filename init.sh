#!/bin/sh
# init.sh for Docker

service ssh start

sed -i.bak -e '/^# add traps ===#/,/# add traps ===#$/d' ~/.bashrc

cat <<EOF >>~/.bashrc
# add traps ===#
trap 'service ssh stop; exit 0' TERM
# end traps ===#
EOF

exec /bin/bash
