# # Stage 1: Build Stage (Generate the optimized Keycloak config)
# FROM quay.io/keycloak/keycloak:26.1.4 AS builder
# #FROM docker.io/bitnami/keycloak:26.1.4-debian-12-r0 AS builder

# # Run the build process (Keycloak will generate optimized config in /opt/keycloak/data)
# #RUN /opt/bitnami/keycloak/bin/kc.sh build  --http-relative-path=/keycloak --health-enabled=true --metrics-enabled=true --db=postgres
# RUN /opt/keycloak/bin/kc.sh build --http-relative-path=/keycloak --health-enabled=true --metrics-enabled=true --db=postgres
# # Stage 2: Final Keycloak Image
#FROM quay.io/keycloak/keycloak:26.1.4
FROM quay.io/keycloak/keycloak:26.1.4 

# Copy the built configuration from the builder stage to the final image
#COPY --from=builder /opt/keycloak/data /opt/keycloak/data
#COPY --from=builder /opt/bitnami/keycloak/data /opt/bitnami/keycloak/data
#COPY --from=builder /opt/bitnami/scripts/ /opt/bitnami/scripts/
RUN /opt/keycloak/bin/kc.sh build --spi-user-cache-default-enabled=true --http-relative-path=/keycloak --health-enabled=true --metrics-enabled=true --db=postgres --features=admin-api,account-api,admin-fine-grained-authz
# Command to run Keycloak in production mode
CMD ["start", "--optimized"]