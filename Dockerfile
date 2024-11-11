# ベースイメージとして公式のHomebridgeイメージを使用
FROM oznu/homebridge:latest

# Node.jsをバージョン20に更新
RUN apt-get update && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g n && n 20

# Homebridge UIとSwitchBotプラグインのインストール
RUN npm install -g --unsafe-perm homebridge-config-ui-x@latest @switchbot/homebridge-switchbot@latest

# Homebridge UIのポートを公開
EXPOSE 8581

# Homebridgeの起動
CMD ["homebridge", "-I"]