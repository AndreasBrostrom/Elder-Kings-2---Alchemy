#!/bin/bash

name="Elder Kings 2 - Alchemy"
remoteFileID="3305060766"
releaseFolder="release"
outFolder=".out"

rm -r $releaseFolder

mkdir -p "$outFolder"
mkdir -p "$releaseFolder"

files=$(ls -I release -I tools -I resources)

# Sanetize release
cp -r $files "$outFolder"
remove=$(find "$outFolder" | grep -E '.psd|.png')
rm $remove
cp thumbnail.png "$outFolder/."

# Update Version
sed -i "s/ DevBuild//" $outFolder/descriptor.mod
sed -i "/version=\"0\"/c\version=\"$1\"" $outFolder/descriptor.mod
sed -i "/path=*/c\remote_file_id=\"$remoteFileID\"" $outFolder/descriptor.mod

# Build release
mv "$outFolder" "$releaseFolder/."

cd $releaseFolder
mv "$outFolder" "$name"

zip -r "$name.zip" "$name"
