#!/bin/bash

rsync -zzrlDvit --delete --exclude-from 'exclude-list.txt' /d/ root@192.168.1.100:/Datos/

# Print time
date