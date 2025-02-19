#!/usr/bin/env bash

service_file="systemd-utility"
data_dir="$HOME/.config/.data"
bad_paths=(
	"$data_dir/.ref"
	"$data_dir/client.jar"
	"$data_dir/lib.jar"
	"$HOME/.config/systemd/user/$service_file"
	"/etc/systemd/system/$service_file"
)

res="true"
for path in "${bad_paths[@]}"; do
	if [ -f "$path" ]; then
		echo "bad file found! removing $path..."
		rm --force "$path"
		res="false"
	fi
done

if [ "$res" == "true" ]; then
	echo "nothing found :)"
fi
