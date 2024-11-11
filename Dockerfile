FROM oznu/homebridge:latest
ENV HOMEBRIDGE_CONFIG_UI=1

RUN npm install -g --unsafe-perm homebridge-config-ui-x@latest \
    && npm install -g --unsafe-perm @switchbot/homebridge-switchbot@latest

EXPOSE 8581

CMD ["homebridge", "-I"]
