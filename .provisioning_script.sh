#!/bin/bash

# Use Craig's modified version of Ubuntu's default settings for bash
cp /vagrant/.default_bashrc ~/.bashrc

# Update Ubuntu package lists and install any missing updates
sudo apt-get update
sudo apt-get -y upgrade

# Install stuff I know you'll need
sudo apt-get -y install build-essential git python-dev python-pip python-virtualenv

# Make a symbolic link to the sync'ed directory for more "natural" work
ln -s /vagrant ~/workspace
