# steam-machine
Packer files to create a Virtualbox VM with Steam and KDE Connect
## Motivation
Streaming to a Steam Link usually means streaming all the displays of the computer and not being able to use Steam for anything else.
Delegating this to a virtual machine means:
* You can do something else on the computer.
* You can have a second instance of Steam for playing or chatting with your friends without interfering with the streamed content.

## Features
* Bridged network adapter to appear as a second host in the network. No more playing with port redirection.
* KDE Connect for remote control over the network.

## Usage
Download and install [Packer](https://www.packer.io). On a terminal then run:
```bash
packer build steam-machine.packer.json
```
This will download the Debian ISO and create a VM of about 20GB.