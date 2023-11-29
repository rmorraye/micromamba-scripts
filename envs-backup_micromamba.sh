#!/bin/bash

MICMAMBA='/home/morraye/micromamba/etc/profile.d/micromamba.sh'
source $MICMAMBA

ENVS_BCKP='/home/morraye/envs-micromamba'
mkdir -p $ENVS_BCKP

ENVS=$(micromamba env list)
ENVS=${ENVS#*/}
ENVS=$(echo "$ENVS" | awk '{$NF=""; print $0}' | sed -e 's/[[:space:]]*$//')

for env in $ENVS; do
    micromamba activate $env
    micromamba env export > $ENVS_BCKP/$env.yml
    echo "Exporting environment from micromamba: $env"
done
