#!/usr/bin/env bash
echo "Syncronizing repo folders"
rsync -irltgovD --delete --exclude 'target' /d/Desarrollo_x901/ams-suite/ appollo@192.168.1.244:/home/appollo/Build-Server/bare-repos/ams/

echo "Syncronizing maven repository"
rsync -irltgovD --delete --exclude 'target' /d/appollo-devel/maven_repository/ appollo@192.168.1.244:/home/appollo/Build-Server/maven-repository/