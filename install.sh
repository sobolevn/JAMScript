#!/usr/bin/env bash

echo "Installing JAMScript.."
# echo "IMPORTANT: You can be prompted to enter the sudo password.."
if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

if [[ $OSTYPE != 'darwin'* ]]; then
  echo "The local environment is not MacOS. Installing a compatibility layer for mDNS modules..."
  sudo apt-get install libavahi-compat-libdnssd-dev -y
fi

cd lib/jamserver 
npm install 
cd ../..

cd lib/jdiscovery
npm install 

cd ../..
npm install

echo "Installing mDNS.."
cd lib/jdiscovery/mdns
npm link --unsafe-perm

cd ../../..
npm run link