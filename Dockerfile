# ベースイメージとして公式のHomebridgeイメージを使用
FROM oznu/homebridge:latest

# 必要なパッケージのインストールとNode.jsのバージョンを更新
RUN apt-get update && apt-get install -y curl ca-certificates \
    && update-ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_22.10.0 | bash - \
    && apt-get install -y nodejs \
    && npm install -g n && n 22.10.0

# Homebridge UIとSwitchBotプラグインのインストール
RUN npm install -g --unsafe-perm homebridge-config-ui-x@latest @switchbot/homebridge-switchbot@latest

# Homebridge UIのポートを公開
EXPOSE 8581

# Homebridgeの起動
CMD ["homebridge", "-I"]