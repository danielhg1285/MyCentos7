
#!/bin/bash

rsync -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" -zzrlDvit --delete appollo@173.212.248.254:/home/appollo/updateNod/ \
/d/updateNod/

echo "Latest version is"
cat /d/updateNod/update.ver | grep 2020 | sort -n | tail -1