#!/usr/bin/env bash
# Script to install conda.

# Create installation directory.
mkdir -p ~/miniconda3
# Download and execute installation script.
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
# Remove the installation script.
rm ~/miniconda3/miniconda.sh