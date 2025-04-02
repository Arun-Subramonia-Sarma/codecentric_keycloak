export NS=yms-keycloak-26-1-4-code
kubectl delete ns $NS $AZ_DEV
kubectl create namespace $NS $AZ_DEV
# kubectl create cm keycloak-config --from-file=keycloak.conf $AZ_DEV -n $NS
kubectl apply -f keycloak-secrets.yaml $AZ_DEV -n $NS
helm install keycloak codecentric/keycloakx $AZ_DEV -n $NS --create-namespace -f value-poc.yaml
# helm install keycloak bitnami/keycloak $AZ_DEV -n yms-keycloak-26-1-4 --create-namespace \
#   --set auth.adminUser=admin \
#   --set auth.adminPassword="" \
#   --set proxy=edge \
#   --set postgresql.enabled=false \
#   --set externalDatabase.host=psql-dyf-db1-flexi-dev.postgres.database.azure.com \
#   --set externalDatabase.port=5432 \
#   --set externalDatabase.user=keycloak \
#   --set externalDatabase.database=keycloak_25_0_0 \
#   --set externalDatabase.type=postgresql \
#   --set externalDatabase.password=oL6TFLIvLF \
#   --set extraEnvVars[0].name=KEYCLOAK_DATABASE_SCHEMA \
#   --set extraEnvVars[0].value=keycloak_26_1_4 \
#   --set extraEnvVars[1].name=KEYCLOAK_ADMIN_PASSWORD \
#   --set extraEnvVars[1].valueFrom.secretKeyRef.name=keycloak-secrets \
#   --set extraEnvVars[1].valueFrom.secretKeyRef.key=admin-password \
#   --set extraEnvVars[2].name=KC_DB_SCHEMA \
#   --set extraEnvVars[2].value=keycloak_26_1_4  \
#   --set extraEnvVars[5].name=KC_CACHE \
#   --set extraEnvVars[5].value=ispn \
#   --set extraEnvVars[6].name=KC_CACHE_STACK \
#   --set extraEnvVars[6].value=kubernetes

