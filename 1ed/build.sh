#!/bin/bash

git config --global user.email "you@example.com"
git config --global user.name "Travis Docker"
git clone https://thiagohersan:$GHTOKEN@github.com/associacaosilo/labdeemergencia.silo.org.br.git
cd labdeemergencia.silo.org.br
sed -i -e 's/git@github.com:/https:\/\/thiagohersan:$GHTOKEN@github.com\//g' .gitmodules
./deploy.sh

cd ..
rm -rf labdeemergencia.silo.org.br
