#!/bin/bash
##############################################################################
# Copyright (c) 2016 ZTE Coreporation and others.
# hu.zhijiang@zte.com.cn
# sun.jing22@zte.com.cn
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################
set -eux
DAISYDIR=$1
OPNFV_ARTIFACT_VERSION=$2

function build_rpm_pkg {
    # Cleanup prev build resutls
    rm -rf $DAISYDIR/build_output
    mkdir -p $DAISYDIR/build_output

    sudo docker build -t daisy4nfv_rpm ../../docker
    sudo docker run --rm -v $DAISYDIR:/opt/daisy4nfv \
                    -v $CACHE_DIRECTORY:/home/cache \
                    -t daisy4nfv_rpm \
                    /opt/daisy4nfv/ci/build_rpm/build_rpms_docker.sh \
                    $OPNFV_ARTIFACT_VERSION
}

function cleanup_container {
    containers_to_kill=$(sudo docker ps -a \
                                        --filter "label=daisy_image_version" \
                                        --format "{{.Names}}")

    if [[ ! -z "$containers_to_kill" ]]; then
        ops='{{range .Mounts}} {{printf "%s\n" .Name }}{{end}}'
        volumes_to_remove=$(sudo docker inspect -f \
                                                $ops ${containers_to_kill} \
                                                | egrep -v '(^\s*$)' \
                                                | sort | uniq)

        sudo docker stop -t 2 ${containers_to_kill} >/dev/null 2>&1
        sudo docker rm -v -f ${containers_to_kill} >/dev/null 2>&1

        if [[ ! -z "$volumes_to_remove" ]]; then
            sudo docker volume rm ${volumes_to_remove} >/dev/null 2>&1
        fi
    fi
}

function cleanup_docker_image {
    images_to_delete=$(sudo docker images -a \
                                          --format "{{.ID}}" \
                                          --filter "label=daisy_image_version")

    echo "Removing images... $images_to_delete"
    if [[ ! -z "$images_to_delete" ]]; then
        sudo docker rmi -f ${images_to_delete} >/dev/null 2>&1
    fi
}

cleanup_container
cleanup_docker_image
build_rpm_pkg
