#!/bin/bash

APP_HOME="${HOME}/${APP_NAME}"

if [ ! -f mix.esx ]; then
  yes | mix local.hex
  yes | mix archive.install hex phx_new
  yes | mix phx.new --install $APP_HOME 
  touch $APP_HOME/assets/css/app.css
  mv $HOME/templates/package.template.json $APP_HOME/assets/package.json
  mv $HOME/templates/App.template.svelte $APP_HOME/assets/js/App.svelte
  mv $HOME/templates/app.template.js $APP_HOME/assets/js/app.js
  mv $HOME/templates/build.template.js $APP_HOME/assets/build.js
  (cd $APP_HOME/assets && yarn)
  sed -i "s/username: \"postgres\"/username: \"$POSTGRES_USERNAME\"/" $APP_HOME/config/dev.exs
  sed -i "s/password: \"postgres\"/password: \"$POSTGRES_PASSWORD\"/" $APP_HOME/config/dev.exs
  sed -i "s/hostname: \"localhost\"/hostname: \"$POSTGRES_HOST\"/" $APP_HOME/config/dev.exs
  sed -i "s/ip: {127, 0, 0, 1}/ip: {0, 0, 0, 0}/" $APP_HOME/config/dev.exs
  sed -i "s/esbuild: .*/node: [\"build\.js\", \"--watch\", cd: Path.expand(\"..\/assets\", __DIR__)]/" $APP_HOME/config/dev.exs
  (cd $APP_HOME && yes | mix ecto.create)
fi

(cd $APP_HOME && mix phx.server)
