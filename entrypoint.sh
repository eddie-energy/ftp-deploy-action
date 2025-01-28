#!/bin/sh
set -eu
echo "Starting SFTP action"

workspace=$GITHUB_WORKSPACE
source="$workspace/$1"
destination=$2
host=$3
user=$4
password=$5
echo "source directory: $source"
echo "destination directory: $destination"

echo "Moving to source directory"
cd $source


echo "Uploading files..."
lftp ftp://$user:$password@$host:21 -e "mkdir -p $destination; ls; mirror --delete-first --transfer-all -R . $destination; bye;"
echo "Done"
