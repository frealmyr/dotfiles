#!/bin/sh

# Used with MacOS Automator to automatically kill Adobe processes after login
sudo -H killall -9 ACCFinderSync 'Core Sync' AdobeCRDaemon 'Adobe Creative' AdobeIPCBroker node 'Adobe Desktop Service' 'Adobe Crash Reporter' AdobeIPCBroker Adobe_CCXProcess.node
