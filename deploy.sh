#!/bin/bash

git submodule init
git submodule update

## 1ED
pushd labdeemergencia1ed
git pull origin master
jekyll build --destination _site/1ed
popd

## 2ED
pushd labdeemergencia2ed
git pull origin master
jekyll build --destination _site/2ed
popd

## update submodules
git add labdeemergencia1ed labdeemergencia2ed
git commit -m "update submodules to their latest commit"
git push origin master
git checkout -- .

## create new branch and push
mv labdeemergencia1ed/_site/1ed .
mv labdeemergencia2ed/_site/2ed .
rm -rf labdeemergencia1ed labdeemergencia2ed
git checkout --orphan gh-pages

git rm --cached -r .
git add CNAME index.html js
git add 1ed
git add 2ed
git commit -m "updates sites"
git push origin :gh-pages
git push -u origin gh-pages

## clean up local
git checkout -f master
git branch -D gh-pages
