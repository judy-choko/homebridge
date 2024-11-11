# Node.js 22.10.0をベースイメージとして使用
FROM node:22.10.0

# Homebridgeと最新のHomebridge UI、SwitchBotプラグインのインストール
RUN npm install -g --unsafe-perm homebridge \
    && npm install -g --unsafe-perm homebridge-config-ui-x@latest \
    && npm install -g --unsafe-perm @switchbot/homebridge-switchbot@latest

# Homebridge UIのポートを公開
EXPOSE 8581

# Homebridgeの起動
CMD ["homebridge", "-I"]