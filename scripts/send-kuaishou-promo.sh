#!/bin/bash

# 快手币充值定时发送脚本
# 发送到北苍星际速充群组

IMAGE_URL="https://i.ibb.co/8LdNyr6B/image.png"
CHAT_ID="-1003755918989"
BOT_TOKEN="8036332463:AAE7DBtPnkRYWcUmeDg462xbOv_oOIrS8ro"

MESSAGE_MESSAGE='🔥快手币限时秒杀·全网底价🔥

⚡️24小时秒到账 · 不用等 · 不用问 · 下单即充⚡️

———————————————

🔥多档热销面额

⚡️100快币 —— 仅15元
⚡️300快币 —— 仅30元
⚡️500快币 —— 仅65元
⚡️980快币 —— 仅120元
⚡️2000快币 —— 仅220元
⚡️3000快币 —— 仅330元
⚡️4000快币 —— 仅430元
⚡️5000快币 —— 仅520元
⚡️8888快币 —— 仅938元
⚡️9999快币 —— 仅999元
⚡️19800快币 —— 仅1980元
⚡️20800快币 —— 仅2080元
⚡️30990快币 —— 仅3099元

———————————————

💰充得多省得多·自用/送礼都划算

🔔别比价，直接冲！手慢无～

———————————————

关注北苍星际速充：

⦁ 客服飞机✈️： @bcsz88
⦁ 联系电话☎️： 09688337441
⦁ 北苍星际速充群： @bcsc88

#快手币 #快币充值 #24小时秒充 #低价长期有效 #无忧服务充值中心'

# 发送带图片的消息
curl -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendPhoto" \
  -F "chat_id=${CHAT_ID}" \
  -F "photo=${IMAGE_URL}" \
  -F "caption=${MESSAGE_MESSAGE}" \
  -F "parse_mode=HTML"

echo "快手币充值消息已发送到北苍星际速充群组 $(date)" >> ~/.openclaw/workspace/logs/kuaishou-cron.log
