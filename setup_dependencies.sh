#!/bin/bash -ex

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" keyboard-configuration
apt-get install -y ninja-build stow libgmock-dev git
./src/cartographer/scripts/install_abseil.sh

rosdep update
rosdep install --from-paths "${SOURCE_DIR}" --ignore-src -y

