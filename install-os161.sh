#!/bin/bash

export PATH=$HOME/os161/tools/bin:$PATH
mkdir -p $HOME/os161/root

# configure userland tools
cd $HOME/os161/src
./configure --ostree=$HOME/os161/root

# uncomment the following if you need to update the includes and dependencies
#bmake includes
#bmake depend
bmake
bmake install

export PATH=$HOME/os161/tools/bin:$PATH
mkdir -p $HOME/os161/root

# configure kernel with the sample DUMBVM configuration
cd kern/conf/
./config DUMBVM

# compile kernel with the DUMBVM configuration
cd ../compile/DUMBVM
bmake depend
bmake 
bmake install
