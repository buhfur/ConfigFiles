#!/bin/bash

for x in /mnt/media/jellyfin/archives/torrent-server/*; do
    abs_dir=$x
    file=$(basename ${x})
    stripped_ext="${file%.*.*}"

    if [[ $file == "usr-local-bin.tar.gz" ]] || [[ $file == "usr-local-sbin.tar.gz" ]]; then

        if [[ $file == "usr-local-bin.tar.gz" ]]; then
            tar -xvzpf ${abs_dir} --directory /usr/local/bin
        elif [[ $file == "usr-local-sbin.tar.gz" ]]; then
            tar -xvzpf ${abs_dir} --directory /usr/local/sbin
        fi
    else
        tar -xvpzf ${abs_dir} --directory /${stripped_ext}

    fi
done
