#!/bin/bash

#CUSTOMIZACAO - AMBIENTE PRD
APP_NAME="keycloak"
DB_VENDOR="mssql"
DB_ADDR="server"
DB_DATABASE="Keycloak"
DB_USER="usrKeycloak"
DB_PASSWORD="pass"
KEYCLOAK_USER="admin"
KEYCLOAK_PASSWORD="admin@123"
PROJECT="trt"

# executar do host sorento

oc login -u system:admin

oc new-build --binary --name=$APP_NAME -l app=$APP_NAME -n $PROJECT

oc start-build  $APP_NAME --from-dir . --follow -n $PROJECT

oc new-app keycloak app=$APP_NAME -e DB_VENDOR=$DB_VENDOR -e DB_ADDR=$DB_ADDR -e DB_DATABASE=$DB_DATABASE -e DB_USER=$DB_USER -e DB_PASSWORD=$DB_PASSWORD -e KEYCLOAK_PASSWORD=$KEYCLOAK_PASSWORD -e KEYCLOAK_USER=$KEYCLOAK_USER -e PROXY_ADDRESS_FORWARDING=true -n $PROJECT

oc create route edge --service=$APP_NAME --insecure-policy=Redirect -n $PROJECT
