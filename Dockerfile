# ベースイメージとして公式のHomebridgeイメージを使用
FROM homebridge/homebridge:latest

# 必要なパッケージのインストールとNode.jsのバージョンを20に更新
RUN apt-get update && apt-get install -y curl ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# npmが正しくインストールされていることを確認するため、シンボリックリンクを設定
RUN ln -sf $(which node) /usr/bin/node && ln -sf $(which npm) /usr/bin/npm

# Homebridge UIとSwitchBotプラグインのインストール
RUN npm install -g --unsafe-perm homebridge-config-ui-x@latest @switchbot/homebridge-switchbot@latest

# Homebridge UIのポートを公開
EXPOSE 8581

# Homebridgeの起動
CMD ["homebridge", "-I"]