#! /bin/sh

#----------run retails.sh ----------------
/app/OmniStore/dataloader/bin/RetailerDataLoader.sh;
#sleep 50;
#------------start the Wildfly server -------
JBOSS_HOME=/app/OmniStore/wildfly-9.0.2.Final;
export JBOSS_HOME


echo "*******starting Jboss********";
nohup /app/OmniStore/wildfly-9.0.2.Final/bin/standalone.sh -b 0.0.0.0 </dev/null > /app/OmniStore/logs/console_wildfly.out 2>&1 &
echo "***Started the JBOSS****"

