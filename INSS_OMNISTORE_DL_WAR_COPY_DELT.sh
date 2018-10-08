#--------- copy the dataloader war file -----------
rm -rf /app/wildfly-9.0.2.Final/standalone/deployments/omnistore-dataloader-batch-2.0.war
rm -rf /app/wildfly-9.0.2.Final/standalone/deployments/omnistore-dataloader-batch-2.0.war.deployed
scp omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Omnistore_War/$1 /app/wildfly-9.0.2.Final/standalone/deployments
if [ $? -eq 0 ]; then echo "Dataloader War File Copied Successfully"; else echo "Dataloader War File Copy Failed"; exit 1; fi

