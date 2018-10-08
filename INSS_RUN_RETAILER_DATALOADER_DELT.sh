#! /bin/sh
#----------run retails.sh ----------------
export JAVA_HOME=/usr/java/jdk1.8.0_51
export PATH=$PATH:$JAVA_HOME/bin

/app/dataloader/bin/RetailerDataLoader.sh;

