# ベースイメージとして公式のHomebridgeイメージを使用
FROM oznu/homebridge:latest

# 必要なパッケージのインストールとNode.jsのバージョンを20に更新
RUN apt-get update && apt-get install -y curl ca-certificates \
    && curl -fsSL https://deb.nodesource.com/setup_22.10.0 | bash - \
    && apt-get install -y nodejs

# npmとNode.jsのシンボリックリンクを作成して、Homebridgeで使用できるように設定
RUN ln -sf /usr/local/bin/node /opt/homebridge/bin/node \
    && ln -sf /usr/local/bin/npm /opt/homebridge/bin/npm

# 環境変数 PATH に /usr/local/bin を追加
ENV PATH="/usr/local/bin:/opt/homebridge/bin/npm:$PATH"


# Homebridge UIとSwitchBotプラグインのインストール
RUN npm install -g --unsafe-perm homebridge-config-ui-x@latest @switchbot/homebridge-switchbot@latest

# Homebridge UIのポートを公開
EXPOSE 8581

# Homebridgeの起動
CMD ["homebridge", "-I"]