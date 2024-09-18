#!/bin/bash

# Specify the source directory where the files are located
src_dir="/ntis2/artifacts"

# Specify the target directory where the files will be copied
target_dir="/opt"

# Loop through the list of directories in the target directory
for service in `ls -1 $src_dir | grep -v 'ntis.jar\|gradle-wrapper.jar\|jacocoagent.jar\|error.txt\|Scripts\|tippecanoe\|ntis-policy.' | sed -e 's/\-0.1.jar$//'`
do
  echo "processing $service"
  dir="$target_dir/$service"
  if [ ! -d "$dir" ]; then
echo
echo "target dir $dir doesn't exist, creating."
sudo mkdir -p $dir/libs
  fi



sudo cp $src_dir/$service*.jar $dir/libs
  echo "Copied service $service jar to directory $dir"
  sudo chmod 755 $dir -R
  cd "$dir/libs"
  echo $dir
  echo $service
  sudo ln -s "$dir"/libs/$service-0.1.jar "$dir"/libs/$service.jar &>$src_dir/error.txt
  cat "$src_dir/error.txt"
done

SERVICE_FILES="$src_dir"/Scripts/Services/Core/*
for f in $SERVICE_FILES
do
  service_name=$(basename $f .service)
  echo "Copying service for $service_name..."
  sudo cp $f /lib/systemd/system/$service_name.service &>$src_dir/error.txt
  sudo systemctl enable $service_name
done

echo "Copying tippecanoe to TileGenerationService location"
sudo cp "$src_dir"/tippecanoe /opt/TileGenerationService/tippecanoe