#! /bin/sh
###Name: INSS_OMNISTORE_JOB1_COPY.sh

if [ ! -d /app/OmniStore/wildfly-9.0.2.Final ] ; then
#-----------Copying the Wildfly distribution -------
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_software/wildfly-9.0.2.Final.zip /app/OmniStore

unzip /app/OmniStore/wildfly-9.0.2.Final.zip -d /app/OmniStore/
fi

if [ ! -d /app/OmniStore/sym-corp ] ; then
#----Copying the Symmetric distribution binary file ------
scp -r omniadmin@lnxs0954.ghanp.kfplc.com:/app/sym-corp  /app/OmniStore/
sleep 50;
fi

if [ ! -d /app/OmniStore/dataloader ] ; then
#-----Copy dataloader zip -----
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_software/dataloader.zip /app/OmniStore/
unzip /app/OmniStore/dataloader.zip -d /app/OmniStore/
sleep 100;
fi
 if [ ! -d /app/OmniStore/posapps ] ; then
mkdir /app/OmniStore/posapps;
chmod 777 /app/OmniStore/posapps;
fi

scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/OmniStoreProperties/app_server_prop_sandpit/standalone.xml /app/OmniStore/wildfly-9.0.2.Final/standalone/configuration/
#scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/OmniStoreProperties/app_server_prop_sandpit/web-config.properties /app/OmniStore/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/
#scp omniadmi@lnxs0954.ghanp.kfplc.com:/app/OmniStoreProperties/app_server_prop_sandpit/hibernate.properties /app/OmniStore/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/hibernate/main/
#sleep 10;
#scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/OmniStoreProperties/app_server_prop_sandpit/dataloader.properties /app/OmniStore/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/dataloader/main/
scp -r omniadmin@lnxs0954.ghanp.kfplc.com:/app/OmniStoreProperties/app_server_prop_sandpit/posconf /app/OmniStore/wildfly-9.0.2.Final/modules/system/layers/base/com/
sleep 10;
#----Copying the oracle .properties file---------
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/OmniStoreProperties/sym_ds_oracle_prop_sandpit/ci_oracle.properties /app/OmniStore/sym-corp/symmetric-3.6.17/bin

#---------Copy retail Data ------------
scp -r omniadmin@lnxs0954.ghanp.kfplc.com:/app/OmniStore/dataloader/data/Retailer/ /app/OmniStore/dataloader/data
sleep 50;
#---------- copy ES retailer data ------------
scp -r omniadmin@lnxs0954.ghanp.kfplc.com:/app/OmniStore/dataloader/data/Enterprise/ /app/OmniStore/dataloader/data/Enterprise
sleep 50;
echo "Data Copied successfully";
#--------- copy the dataloader war file -----------
echo "Copying war file";
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_War_Sandpit/omnistore-dataloader-batch-2.0.war /app/OmniStore/wildfly-9.0.2.Final/standalone/deployments
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_War_Sandpit/omnistore-ec-ui-7.2.war /app/OmniStore/wildfly-9.0.2.Final/standalone/deployments
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_War_Sandpit/omnistore-pos-services-7.2.war /app/OmniStore/wildfly-9.0.2.Final/standalone/deployments
sleep 10;
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_DataBase_SandPit_ORACLE/Omnistore-Dbscripts-Bootstrap-Oracle-2.0.sql /app/OmniStore/DB_SCRIPT/
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_DataBase_SandPit_ORACLE/Omnistore-Dbscripts-DDL-Oracle-2.0.sql /app/OmniStore/DB_SCRIPT/
scp omniadmin@lnxs0954.ghanp.kfplc.com:/app/Omnistore_DataBase_SandPit_ORACLE/OMNISTORE_TRIGGERS_ORACLE_POSTGRES.sql /app/OmniStore/sym-corp/symmetric-3.6.17/bin/
echo "Copy Completed";
