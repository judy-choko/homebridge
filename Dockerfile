
FROM oznu/homebridge:latest

# Node.jsをバージョン20に更新
RUN apk add --no-cache --update nodejs npm && npm install -g n && n 22.10.0

# Homebridge UIとSwitchBotプラグインのインストール
RUN npm install -g --unsafe-perm homebridge-config-ui-x@latest @switchbot/homebridge-switchbot@latest

# Homebridge UIのポートを公開
EXPOSE 8581

# Homebridgeの起動
CMD ["homebridge", "-I"]