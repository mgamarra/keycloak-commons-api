### Create container - PRD SQL-SERVER

oc new-build --binary --name=keycloak -l app=keycloak

oc start-build keycloak --from-dir=. --follow

oc new-app keycloak app=keycloak -e DB_VENDOR=mssql -e DB_ADDR=SQL_SERVER_HOST -e DB_DATABASE=DATABASE_NAME -e DB_USER=USER_DB_KEYCLOAK -e DB_PASSWORD=DB_USER_PASSWORD -e KEYCLOAK_PASSWORD=KEYCLOAK_PASS -e KEYCLOAK_USER=USER_ADMIN -e PROXY_ADDRESS_FORWARDING=true

oc create route edge --service=ocb-config-server --insecure-policy=Redirect -n prd

#### Para adicionar os discos de persistencia ao Keycloak

![Vídeo de demonstração](movies/Adicionar_disco_ao_container_keycloak.mov?raw=true)
