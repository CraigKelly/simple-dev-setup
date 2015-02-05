#!/bin/bash

# Update Ubuntu package lists and install any missing updates
sudo apt-get update
sudo apt-get -y upgrade

# Install stuff I know you'll need
sudo apt-get -y install build-essential git python-dev python-pip python-virtualenv dos2unix

# Use Craig's modified version of Ubuntu's default settings for bash
# AND fix any line ending issues
cp /vagrant/.default_bashrc ~/.bashrc
dos2unix ~/.bashrc

# Make a symbolic link to the sync'ed directory for more "natural" work
ln -s /vagrant ~/workspace
