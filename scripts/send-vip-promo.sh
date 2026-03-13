#!/bin/bash

# 会员充值定时发送脚本
# 发送到北苍星际速充群组

IMAGE_URL="https://i.ibb.co/Z6Xb9BPd/image.png"
CHAT_ID="-1003755918989"
BOT_TOKEN="8036332463:AAE7DBtPnkRYWcUmeDg462xbOv_oOIrS8ro"

MESSAGE='💎 会员充值价格 💎

———————————————

KBZ价格：

三个月 —— 60000
六个月 —— 70000
12个月 —— 120000

———————————————

USDT价格：

三个月 —— 14 u
六个月 —— 18 u
12个月 —— 33 u

———————————————

支付宝微信价格：

三个月 —— 110¥
六个月 —— 150¥
12个月 —— 260¥

———————————————

注意事项：

⚠️ 只接受秒转、不接受多转
⚠️ 不收诈骗来的钱、收到诈骗钱不退款
⚠️ 不开会员

———————————————

关注北苍星际速充：

⦁ 客服飞机✈️： @bcsz88
⦁ 联系电话☎️： 09688337441
⦁ 北苍星际速充群： @bcsc88'

# 发送带图片的消息
curl -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendPhoto" \
  -F "chat_id=${CHAT_ID}" \
  -F "photo=${IMAGE_URL}" \
  -F "caption=${MESSAGE}" \
  -F "parse_mode=HTML"

echo "会员充值消息已发送到北苍星际速充群组 $(date)" >> ~/.openclaw/workspace/logs/vip-cron.log
