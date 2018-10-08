#! /bin/sh
#Name : INSS_COPY_DATALOADER_DELT
#Parameter: Env Master data sheet with QFN, Name of the environment


#---------Copy Retailer Data-----
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/Retailer_dataloader_props/dataloader.properties /app/dataloader/config
if [ $? -eq 0 ]; then echo "dataloader file Copied Successfully"; else echo "dataloader file Copy Failed"; exit 1; fi
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/Retailer_dataloader_props/hibernate.properties /app/dataloader/config
if [ $? -eq 0 ]; then echo "hibernate file Copied Successfully"; else echo "hibernate file Copy Failed"; exit 1; fi
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/Retailer_dataloader_props/hibernate.properties /app/dataloader/lib
if [ $? -eq 0 ]; then echo "hibernate file Copied Successfully"; else echo "hibernate file Copy Failed"; exit 1; fi
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/Retailer_dataloader_props/RetailerDataLoader.jar /app/dataloader/lib
if [ $? -eq 0 ]; then echo "Retailer Daraloader Jar Copy Successful"; else echo "Retailer Dataloader Jar Copy Failed"; exit 1; fi
chmod 777 /app/OmniStore/dataloader/lib/RetailerDataLoader.jar
if [ $? -eq 0 ]; then echo "Jar Change mode Successful"; else echo "Jar Change mode Failed"; exit 1; fi
scp -r omniadmin@lnxs0953.ghanp.kfplc.com:/app/Automation_Source/OmniStoreProperties/Retailer_dataloader_props/RetailerDataLoader.sh /app/dataloader/bin
if [ $? -eq 0 ]; then echo "Retailer Script File Copied Successfully"; else echo "Retailer Script File Copy Failed"; exit 1; fi
chmod 777 /app/OmniStore/dataloader/bin/RetailerDataLoader.sh
if [ $? -eq 0 ]; then echo "Script Change mode Successful"; else echo "Script Change mode Failed"; exit 1; fi



file=$1;
IFS=',';
while read -r envName symPDClsNm symDsDBUrl symDsDBUser symDsDBPass symDsDBRegUrl symDsDBSyncUrl rDlhome rDlMode jdialect waApiUrl waWsLnk waBtchUrl waPSLnk waLylUrl wcStSrAdd wcClSrAdd rdshpath omnStRt
do
#echo $envName;
#echo $2;
if [[ $envName = $2 ]]
then
sed -i "s/{rDlhome}/$rDlhome/" /app/dataloader/config/dataloader.properties;
sed -i "s/{rDlMode}/$rDlMode/" /app/dataloader/config/dataloader.properties;
sed -i "s/{symPDClsNm}/$symPDClsNm/" /app/dataloader/config/hibernate.properties;
sed -i "s/{symDsDBUrl}/$symDsDBUrl/" /app/dataloader/config/hibernate.properties;
sed -i "s/{symDsDBUser}/$symDsDBUser/" /app/dataloader/config/hibernate.properties;
sed -i "s/{symDsDBPass}/$symDsDBPass/" /app/dataloader/config/hibernate.properties;
sed -i "s/{jdialect}/$jdialect/" /app/dataloader/config/hibernate.properties;
sed -i "s/{rdshpath}/$rdshpath/" /app/dataloader/bin/RetailerDataLoader.sh;
cp /app/dataloader/config/hibernate.properties /app/dataloader/lib;

fi
done < "$file"
echo "Properties updated";
exit;

