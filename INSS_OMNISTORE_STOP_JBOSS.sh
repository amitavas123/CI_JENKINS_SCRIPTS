#! /bin/bash

#Name: Stopping the Jboss Wildfly server

pgrep -d" " -f "wildfly" | xargs kill;
echo "killing Process"
sleep 10;

rm -rf /app/wildfly-9.0.2.Final/standalone/deployments/omnistore-ec-ui-7.2.war
rm -rf /app/wildfly-9.0.2.Final/standalone/deployments/omnistore-ec-ui-7.2.war.deployed
rm -rf /app/wildfly-9.0.2.Final/standalone/deployments/omnistore-pos-services-7.2.war
rm -rf /app/wildfly-9.0.2.Final/standalone/deployments/omnistore-pos-services-7.2.war.deployed
rm -rf /app/wildfly-9.0.2.Final/standalone/tmp/vfs/
echo "Server Stopped and Cleaned Up "

