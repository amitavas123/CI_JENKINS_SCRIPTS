#! /bin/sh
#Name : INSS_COPY_DATALOADER_DATA_DELT

#---------Copy retail Data ------------
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Data/Retailer/ /app/dataloader/data/
if [ $? -eq 0 ]; then echo "Retailer Data Copied Successfully"; else echo "Retailer Data Copy Failed"; exit 1; fi

#---------- copy ES retailer data ------------
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/Data/Enterprise/ /app/dataloader/data/
if [ $? -eq 0 ]; then echo "Enterprise Data Copied Successfully"; else echo "Enterprise Data Copy Failed"; exit 1; fi

