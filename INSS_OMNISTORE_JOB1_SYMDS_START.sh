#! /bin/sh
#----starting the create table command ------
#/app/OmniStore/sym-corp/symmetric-3.6.17/bin/symadmin -p  /app/OmniStore/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties create-sym-tables

echo "Created Table";

#------trigger OMNISTORE_TRIGGERS_ORACLE_POSTGRES.sql------
/app/OmniStore/sym-corp/symmetric-3.6.17/bin/dbimport -p /app/OmniStore/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties /app/OmniStore/sym-corp/symmetric-3.6.17/bin/OMNISTORE_TRIGGERS_ORACLE_POSTGRES.sql;


echo "Trigger fired";

#-----------Start the Symmetric DS Agent ---------------
nohup /app/OmniStore/sym-corp/symmetric-3.6.17/bin/sym -p /app/OmniStore/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties --port 8787 --server </dev/null > /app/OmniStore/logs/console_symds.out 2>&1 & 

echo "Run Server";
