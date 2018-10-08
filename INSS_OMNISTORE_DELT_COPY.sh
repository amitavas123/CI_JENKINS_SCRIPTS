#! /bin/sh
###Name: INSS_OMNISTORE_DELT_COPY

if [ ! -d /app/wildfly-9.0.2.Final ] ; then
#-----------Copying the Wildfly distribution -------
scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Omnistore_software/wildfly-9.0.2.Final.zip /app/
if [ $? -eq 0 ]; then echo "WILDFLY DISTRIBUTION  Copied Successfully"; else echo "WILDFLY DISTRIBUTION Copy Failed"; exit 1; fi

unzip /app/wildfly-9.0.2.Final.zip -d /app/
if [ $? -eq 0 ]; then echo "Wildfly Distribution File Unzipped Successfully"; else echo "Wildfly File Unzip Failed"; exit 1; fi
fi

if [ ! -d /app/sym-corp ] ; then
#----Copying the Symmetric distribution binary file ------
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Omnistore_software/sym-corp  /app/
if [ $? -eq 0 ]; then echo "SYMDS Copied Successfully"; else echo "SYMDS Copy Failed"; exit 1; fi
#sleep 50;
fi

if [ ! -d /app/dataloader ] ; then
#-----Copy dataloader zip -----
scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Omnistore_software/dataloader.zip /app/
if [ $? -eq 0 ]; then echo "DATALOADER File Copied Successfully"; else echo "DATALOADER File Copy Failed"; exit 1; fi

unzip /app/dataloader.zip -d /app/OmniStore/
if [ $? -eq 0 ]; then echo "Dataloader File Unzipped Successfully"; else echo "Dataloader File Unzip Failed"; exit 1; fi
#sleep 100;
fi
 if [ ! -d /app/posapps ] ; then
mkdir /app/posapps;
chmod 777 /app/posapps;
if [ $? -eq 0 ]; then echo "Change mode Successful"; else echo "Change mode Failed"; exit 1; fi
fi

scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/standalone.xml /app/wildfly-9.0.2.Final/standalone/configuration/
if [ $? -eq 0 ]; then echo "STANDALONE File Copied Successfully"; else echo "STANDALONE File Copy Failed"; exit 1; fi

scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/posconf /app/wildfly-9.0.2.Final/modules/system/layers/base/com/
if [ $? -eq 0 ]; then echo "POSCONF File Copied Successfully"; else echo "POSCONF File Copy Failed"; exit 1; fi
#sleep 10;
#----Copying the oracle .properties file---------
scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/ci_oracle.properties /app/sym-corp/symmetric-3.6.17/bin
if [ $? -eq 0 ]; then echo "CI_ORACLE File Copied Successfully"; else echo "CI_ORACLE File Copy Failed"; exit 1; fi

scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/envDetails.csv /app/
if [ $? -eq 0 ]; then echo "Environment File Copied Successfully"; else echo "EnvironmentFile Copy Failed"; exit 1; fi

echo "Copy Completed";

