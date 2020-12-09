#!/bin/bash

git submodule init
git submodule update

## 1ED
pushd labdeemergencia1ed
git pull origin master
mkdir .jekyll-cache _site
jekyll build --destination _site/1ed
popd

## 2ED
pushd labdeemergencia2ed
git pull origin master
mkdir .jekyll-cache _site
jekyll build --destination _site/2ed
popd

## 3ED
pushd labdeemergencia3ed
git pull origin master
mkdir .jekyll-cache _site
jekyll build --destination _site/3ed
popd

## root
mkdir .jekyll-cache _site
jekyll build --destination _site

## update submodules
git add labdeemergencia1ed labdeemergencia2ed labdeemergencia3ed
git commit -m "update submodules to their latest commit"
git push origin master
git checkout -- .

## create new branch and push
mv labdeemergencia1ed/_site/1ed .
mv labdeemergencia2ed/_site/2ed .
mv labdeemergencia3ed/_site/3ed .
rm -rf css js media
mv _site/* .
rm -rf labdeemergencia1ed labdeemergencia2ed labdeemergencia3ed _site
git checkout --orphan gh-pages

git rm --cached -r .
git add CNAME .nojekyll index.html 404.html js media css
git add 1ed
git add 2ed
git add 3ed
git commit -m "updates all sites"
git push origin :gh-pages
git push -u origin gh-pages

## clean up local
git checkout -f master
git branch -D gh-pages
