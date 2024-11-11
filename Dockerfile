# ベースイメージとしてNode.js 20を使用
FROM node:20

# Homebridgeのインストール
RUN npm install -g --unsafe-perm homebridge@latest homebridge-config-ui-x@latest @switchbot/homebridge-switchbot@latest

# Homebridge UIのポートを公開
EXPOSE 8581

# Homebridgeの起動
CMD ["homebridge", "-I"]