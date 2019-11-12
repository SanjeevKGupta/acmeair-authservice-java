FROM websphere-liberty:kernel

COPY --chown=1001:0 src/main/liberty/config/server.xml /config/server.xml
COPY --chown=1001:0 /src/main/liberty/config/server.env /config/server.env
COPY --chown=1001:0 src/main/liberty/config/jvm.options /config/jvm.options
COPY --chown=1001:0 target/acmeair-authservice-java-3.0.war /config/apps/
COPY --chown=1001:0 key.p12 /output/resources/security/key.p12

RUN configure.sh || if [ $? -ne 22 ]; then exit $?; fi


