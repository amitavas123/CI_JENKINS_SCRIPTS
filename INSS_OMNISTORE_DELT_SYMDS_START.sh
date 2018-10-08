#! /bin/sh
#Name: INSS_OMNISTORE_DELT_SYMDS_START
#Parameter: SYMDDS TRIGGER FILE NAME
#------trigger OMNISTORE_TRIGGERS_ORACLE_POSTGRES.sql------
export JAVA_HOME=/usr/java/jdk1.8.0_51
export PATH=$PATH:$JAVA_HOME/bin

/app/sym-corp/symmetric-server-3.8.0/bin/dbimport -p /app/sym-corp/symmetric-server-3.8.0/bin/ci_oracle.properties /app/sym-corp/symmetric-server-3.8.0/bin/$1;

echo "Trigger fired";

