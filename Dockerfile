FROM node:22.10.0

RUN npm install -g --unsafe-perm homebridge \
    && npm install -g --unsafe-perm homebridge-config-ui-x@latest \
    && npm install -g --unsafe-perm @switchbot/homebridge-switchbot@latest

EXPOSE 8581

CMD ["homebridge", "-I"]