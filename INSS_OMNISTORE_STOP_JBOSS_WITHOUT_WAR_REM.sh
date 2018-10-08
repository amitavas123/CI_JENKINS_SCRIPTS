#! /bin/bash

#Name: Stopping the Jboss Wildfly server

pgrep -d" " -f "wildfly" | xargs kill;
echo "Stopping Wildfly successfully"
