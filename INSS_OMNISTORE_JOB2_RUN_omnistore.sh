#! /bin/sh
#### Name:INSS_OMNISTORE_JOB2_RUN_omnistore.sh

#-----------Stopping Jboss WildFly Server --------------
 if lsof -Pi :8183 -sTCP:LISTEN -t >/dev/null ; then
    echo "Stopping JBoss Wildfly .."
    ${JBOSS_HOME}/bin/jboss-cli.sh --connect command=:shutdown
 else
    echo "Jboss Wildfly is  not running "
 fi

#$JBOSS_HOME/bin/jboss-cli.sh --connect ":shutdown"

#---------------Removing the Dataloader war file -------------
rm * /app/OmniStore/wildfly-9.0.2.Final/standalone/deployment

#-------------Deploying the War files ---------------
echo "Deploying war files to Jboss Wildfly.."
scp /tmp/Auto/omnistore-ec-ui-7.2.war  /app/OmniStore/wildfly-9.0.2.Final/standalone/deployment
scp /tmp/Auto/omnistore-pos-services-7.2.war  /app/OmniStore/wildfly-9.0.2.Final/standalone/deployment

#-----------Starting JBoss wildfly Server ------------
export JBOSS_HOME=/app/OmniStore/wildfly-9.0.2.Final
echo "*******Starting Jboss********";
nohup ${JBOSS_HOME}/bin/standalone.sh -b 0.0.0.0 </dev/null > /app/OmniStore/logs/console_OmniPos.out 2>&1 &
echo "***Started the JBOSS****"



 
