FROM quay.io/keycloak/keycloak:24.0.1

COPY themes /opt/keycloak/themes

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]