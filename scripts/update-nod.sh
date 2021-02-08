#!/usr/bin/env bash

rm -rf /home/appollo/updateNod/

wget_dir.sh --recursive --no-parent --no-host-directories --progress bar --cut-dirs 3 \
--user-agent Mozilla --directory-prefix /home/appollo/updateNod http://antivirus.uclv.edu.cu/update/nod32/eset_updvall/

chown -R appollo /home/appollo/updateNod/
