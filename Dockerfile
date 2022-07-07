FROM alpine:latest 

ARG APP_NAME
ARG APP_PORT
ARG UID
ARG GID

EXPOSE $APP_PORT

# Install dependencies 
RUN apk add --no-cache elixir inotify-tools bash nodejs yarn

RUN addgroup -g ${GID} ${APP_NAME}
RUN adduser -D ${APP_NAME} -u ${UID} -G ${APP_NAME}

WORKDIR /home/${APP_NAME} 

COPY install.sh .
COPY templates/ templates 
RUN chmod +x install.sh

WORKDIR /home/${APP_NAME}/${APP_NAME}

RUN chown -R ${APP_NAME}:${APP_NAME} /home/${APP_NAME} 
USER ${APP_NAME}

ENTRYPOINT ["/bin/bash", "../install.sh"]
