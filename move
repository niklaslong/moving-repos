#!/bin/bash

echo What is the name of your subdir?
read subdir

echo What is the url of your subdir?
read subdirurl

echo What is the name of your maindir?
read maindir


git clone $subdirurl

cd $maindir

git remote add $subdir ../$subdir
git fetch $subdir

git checkout -b $subdir $subdir/master
mkdir $subdir
mv * ./$subdir 

git add .
git commit -m"Moves all repo_sub files into a single directory for merging back into repo_main"
git checkout master
git merge $subdir --allow-unrelated-histories 

git branch -D $subdir
git remote rm $subdir


