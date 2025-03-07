FROM registry.redhat.io/rhbk/keycloak-rhel9:26
ADD --chown=keycloak:keycloak --chmod=644 https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc11/23.3.0.23.09/ojdbc11-23.3.0.23.09.jar /opt/keycloak/providers/ojdbc11.jar
ADD --chown=keycloak:keycloak --chmod=644 https://repo1.maven.org/maven2/com/oracle/database/nls/orai18n/23.3.0.23.09/orai18n-23.3.0.23.09.jar /opt/keycloak/providers/orai18n.jar
# Setting the build parameter for the database:
ENV KC_DB=oracle
# Add all other build parameters needed, for example enable health and metrics:
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
#ENV KC_PROFILE=dev
# To be able to use the image with the Red Hat build of Keycloak Operator, it needs to be optimized, which requires Red Hat build of Keycloak's build step:
RUN /opt/keycloak/bin/kc.sh build
