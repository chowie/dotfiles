#!/bin/bash

# build-l5.sh
#
# $PACKAGE = the name of the directory containing the app
# $ENV = the name of the environment file; _e.g. boedevphplx, uatstaging, production__
# $VERSION = tag, commit, branch that you want to deploy
#
# example: `build-l5.sh elobby-pass uatstaging 1.0.2`

# package/folder name the project will be build in
PACKAGE=$1
# the environment we are deploying to
ENV=$2
# version that we are deploying
VERSION=$3

# remember the directory we are starting from
STARTDIR=$(pwd)

# Record details of every command following this, including
# substituting the actual values for variables.
set -x or set -o xtrace 

# chdir to the package directory
cd ${PACKAGE}

#git archive --remote=git@boelnxgitlab.boe.nictusa.com:merts/merts-unlock.git --format=tar 1.0.3 | tar -xf -
#
# checkout the version that we want to deploy. The default
# directory after you cd to here is MASTER, which is probably not 
# what we want to deploy
git checkout $VERSION || exit 1

# remove any existing `.env` file. We will replace it with
# `.env.${ENV}`
if [ -f ./.env ]; then 
    rm ./.env
fi

# Make the new `.env` file
if [ -f ./.env.${ENV} ]; then
    cp ./.env.${ENV} ./.env
fi

# Build deployable app and package into a tarball
if [ -f ./.env ]; then

    # Download Laravel app dependencies; listed in `composer.json`.
    composer install

    php artisan vendor:publish

    # Download javascript dependencies; listed in `pakcage.json`.
    yarn install

    # Create `config/host.php` file; see `michigan-interactive/project-tools`
    php artisan build:hostinfo

    # Create `config/version.php` file; see `michigan-interactive/project-tools`
    php artisan version:build $(git name-rev --tags --name-only $(git rev-parse HEAD))

    # Build project assets; js, css, images, etc.
    npm run prod

    cd ${STARTDIR}

    # Added package to tarball, excluding files we don’t need in the deployed
    # environment.
    tar -zcvf ${PACKAGE}.tar.gz ${PACKAGE} \
        --exclude "${PACKAGE}/.git" \
        --exclude "${PACKAGE}/node_modules" \
        --exclude "${PACKAGE}/.env.*" \
        --exclude "${PACKAGE}/resources/assets"

else 

    echo "No .env file. check your settings. exiting."

fi

