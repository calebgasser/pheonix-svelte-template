FROM alpine:latest 

ARG APP_NAME
ARG APP_PORT
ARG UID
ARG GID

EXPOSE $APP_PORT

# Install dependencies 
RUN apk add --no-cache elixir inotify-tools bash nodejs yarn

RUN adduser -D ${APP_NAME}
RUN addgroup ${APP_NAME} ${APP_NAME}
WORKDIR /home/${APP_NAME} 

COPY install.sh .
COPY templates/ templates 


RUN chmod +x install.sh

RUN chown -R ${APP_NAME}:${APP_NAME} /home/${APP_NAME} 

USER ${APP_NAME} 

ENTRYPOINT ["/bin/bash", "install.sh"]
