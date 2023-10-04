FROM livingatlases/java-11-base:1.0.0

# Lint with:
# docker run --rm -i hadolint/hadolint < Dockerfile

# Args
ARG APP_ARTIFACT=ala-hub
ARG USER=ala-hub
ARG WAR_FILE=./build/libs/ala-hub-*.war

# Env variables
ENV SERVER_PORT="8080"
ENV WAR_FILE_ENV=${WAR_FILE}
ENV JAVA_OPTS="-Djava.awt.headless=true -Xmx256m -Xms256m -XX:+UseConcMarkSweepGC -Dlog4j2.formatMsgNoLookups=true"
ENV DOCKERIZE_OPTS=${DOCKERIZE_ARGS}

# Directories and perms
RUN mkdir -p /data/$APP_ARTIFACT && \
    groupadd -r $USER -g 1000 && useradd -r -g $USER -u 1000 -m $USER && \
    chown -R $USER:$USER /data/$APP_ARTIFACT
WORKDIR /opt/atlas/$APP_ARTIFACT

# war
COPY $WAR_FILE_ENV app.war
RUN chown -R $USER:$USER /opt/atlas/$APP_ARTIFACT

USER $USER
EXPOSE $SERVER_PORT
# hadolint ignore=DL3025
ENTRYPOINT dockerize $DOCKERIZE_OPTS sh -c "java $JAVA_OPTS -jar app.war"
