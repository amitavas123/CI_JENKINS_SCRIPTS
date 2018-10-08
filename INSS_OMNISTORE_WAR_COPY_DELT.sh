#! /bin/sh
###Name: INSS_OMNISTORE_WAR_COPY_DELT
#Parameter: Name of the SYM DS FILE
#--------- copy the dataloader war file -----------
echo "Copying war file";
scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Omnistore_War/omnistore-ec-ui-7.3.war /app/wildfly-9.0.2.Final/standalone/deployments
if [ $? -eq 0 ]; then echo "EC War File Copied Successfully"; else echo "EC War File Copy Failed"; exit 1; fi

scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Omnistore_War/omnistore-pos-services-7.3.war /app/wildfly-9.0.2.Final/standalone/deployments
if [ $? -eq 0 ]; then echo "POS War File Copied Successfully"; else echo "POS War File Copy Failed"; exit 1; fi

scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/$1 /app/sym-corp/symmetric-server-3.8.0/bin/
if [ $? -eq 0 ]; then echo "Property File Copied Successfully"; else echo "Property File Copy Failed"; exit 1; fi

chmod 777 /app/sym-corp/symmetric-server-3.8.0/bin/$1
if [ $? -eq 0 ]; then echo "Change mode Successful"; else echo "Change mode Failed"; exit 1; fi


