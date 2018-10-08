#! /bin/sh
#----starting the create table command ------
#/app/sym-corp/symmetric-server-3.8.0/bin/symadmin -p  /app/sym-corp/symmetric-server-3.8.0/engines/ci_oracle.properties create-sym-tables


#echo "Created Table";

#------trigger OMNISTORE_TRIGGERS_ORACLE_POSTGRES.sql------
/app/sym-corp/symmetric-server-3.8.0/bin/dbimport -p /app/sym-corp/symmetric-server-3.8.0/engines/ci_oracle.properties /app/sym-corp/symmetric-server-3.8.0/bin/$1;


#echo "Trigger fired";

#-----------Start the Symmetric DS Agent ---------------
nohup /app/sym-corp/symmetric-server-3.8.0/bin/sym -p /app/sym-corp/symmetric-server-3.8.0/engines/ci_oracle.properties --port 8787 --server </dev/null > /app/logs/console_symds.out 2>&1 &

#echo "Run Server";

