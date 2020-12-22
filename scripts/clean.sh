#/bin/bash

for ORG_DIR in organizations/*;do
find $ORG_DIR/* -type d,f ! -name 'docker-compose.yaml' -delete
done

for DIR in organizations/*;do
mkdir -- "$DIR/registrar"
done