#! /bin/sh
#Name : Update Properties for Environment
file=$1;
IFS=',';
while read -r envName symPDClsNm symDsDBUrl symDsDBUser symDsDBPass symDsDBRegUrl symDsDBSyncUrl rDlhome rDlMode jdialect waApiUrl waWsLnk waBtchUrl waPSLnk waLylUrl wcStSrAdd wcClSrAdd rdshpath omnStRt

do
#echo $envName;
#echo $2;
if [[ $envName = $2 ]]
then


sed -i "s/{symPDClsNm}/$symPDClsNm/" /app/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties;
sed -i "s/{symDsDBUrl}/$symDsDBUrl/" /app/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties;
sed -i "s/{symDsDBUser}/$symDsDBUser/" /app/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties;
sed -i "s/{symDsDBPass}/$symDsDBPass/" /app/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties;
sed -i "s/{symDsDBRegUrl}/$symDsDBRegUrl/" /app/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties;
sed -i "s/{symDsDBSyncUrl}/$symDsDBSyncUrl/" /app/sym-corp/symmetric-3.6.17/bin/ci_oracle.properties;


sed -i "s/{symPDClsNm}/$symPDClsNm/" /app/wildfly-9.0.2.Final/standalone/configuration/standalone.xml;
sed -i "s/{symDsDBUrl}/$symDsDBUrl/" /app/wildfly-9.0.2.Final/standalone/configuration/standalone.xml;
sed -i "s/{symDsDBUser}/$symDsDBUser/" /app/wildfly-9.0.2.Final/standalone/configuration/standalone.xml;
sed -i "s/{symDsDBPass}/$symDsDBPass/" /app/wildfly-9.0.2.Final/standalone/configuration/standalone.xml;


sed -i "s/{rDlhome}/$rDlhome/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/dataloader/main/dataloader.properties;
sed -i "s/{rDlMode}/$rDlMode/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/dataloader/main/dataloader.properties;

sed -i "s/{symPDClsNm}/$symPDClsNm/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/hibernate/main/hibernate.properties;
sed -i "s/{jdialect}/$jdialect/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/hibernate/main/hibernate.properties;

sed -i "s/{omnStRt}/$omnStRt/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/omnistoreapp/main/omnistoreapp.properties;


sed -i "s/{waApiUrl}/$waApiUrl/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/web-app.properties;
sed -i "s/{waWsLnk}/$waWsLnk/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/web-app.properties;
sed -i "s/{waBtchUrl}/$waBtchUrl/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/web-app.properties;
sed -i "s/{waPSLnk}/$waPSLnk/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/web-app.properties;
sed -i "s/{waLylUrl}/$waLylUrl/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/web-app.properties;

sed -i "s/{wcStSrAdd}/$wcStSrAdd/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/web-config.properties;
sed -i "s/{wcClSrAdd}/$wcClSrAdd/" /app/wildfly-9.0.2.Final/modules/system/layers/base/com/posconf/webconfig/main/properties/web-config.properties;


fi
done < "$file"
echo "Properties updated";
exit;

