#!/bin/bash

PUBIP=$1
THISDIR=$(dirname $(readlink -f $0))

sed -e "s/@PUBIP@/$PUBIP/g" \
    -e "s,@THISDIR@,$THISDIR,g" \
    ssh_config.template > ssh_config

ssh -F $THISDIR/ssh_config domu sudo -u domzero cat /home/domzero/.ssh/id_rsa > $THISDIR/domzero.pem
chmod 0600 $THISDIR/domzero.pem

cat > vncviewer << EOF
#!/bin/bash
set -eux
export VNC_VIA_CMD='/usr/bin/ssh -F $THISDIR/ssh_config -f -L "\$L":"\$H":"\$R" "\$G" sleep 20'
vncviewer -via domzero --PreferredEncoding=hextile localhost:\$1
EOF

chmod 0700 vncviewer
