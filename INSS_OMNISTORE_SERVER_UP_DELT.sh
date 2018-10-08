#! /bin/sh
#Name : Start the Jboss Wildfly Server

#------------start the Wildfly server -------
JBOSS_HOME=/app/wildfly-9.0.2.Final;
export JBOSS_HOME;
export JAVA_HOME=/usr/java/jdk1.8.0_51
export PATH=$PATH:$JAVA_HOME/bin

echo "*******starting Jboss********";
nohup /app/wildfly-9.0.2.Final/bin/standalone.sh -b 0.0.0.0 </dev/null > /app/logs/console_wildfly.out 2>&1 &
#sh /app/wildfly-9.0.2.Final/bin/standalone.sh -b 0.0.0.0 </dev/null > /app/logs/console_wildfly.out 2>&1 &
echo "***Started the JBOSS****"


