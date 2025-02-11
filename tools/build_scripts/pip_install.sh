#!/bin/bash

set -x
set -e   # fail and exit on any command erroring

# Need to set these env vars
: "${TF_VERSION:?}"
: "${PY_VERSION:?}"

# Import build functions.
source ./tools/build_scripts/utils.sh

which python3.10
python3.10 --version

# Install pip
echo "Upgrading pip."
pip install --upgrade pip

# Install TensorFlow.
echo "Installing TensorFlow..."
install_tf "$TF_VERSION"

# Install TensorFlow Recommenders.
echo "Installing TensorFlow Recommenders..."
pip install -e .[docs]

# Test successful build.
echo "Testing import..."
python3.10 -c "import tensorflow_recommenders as tfrs"

echo "Done."
