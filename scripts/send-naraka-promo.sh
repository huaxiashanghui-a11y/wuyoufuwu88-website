#!/bin/bash

# 永劫无间手游元宝直充定时发送脚本
# 发送到北苍星际速充群组

IMAGE_URL="https://i.ibb.co/tMndBzyN/image.png"
CHAT_ID="-1003755918989"
BOT_TOKEN="8036332463:AAE7DBtPnkRYWcUmeDg462xbOv_oOIrS8ro"

MESSAGE='🔥永劫无间手游·元宝直充🔥

✅仅需角色编号｜✅无需账号密码｜✅快速到账

📱官方直充 · 安全高效 · 全程无忧

💰元宝直充面值：

🔹60元宝
🔹300元宝
🔹680元宝
🔹980元宝
🔹1280元宝
🔹1980元宝
🔹3280元宝
🔹6480元宝

———————————————

⚡️正规安全 · 快速高效 · 全程无忧

👉私信我，马上安排！

———————————————

关注北苍星际速充：

⦁ 客服飞机✈️： @bcsz88
⦁ 联系电话☎️： 09688337441
⦁ 北苍星际速充群： @bcsc88

#永劫无间手游 #苹果区充值 #元宝代充 #免号直充 #官方直充 #无忧服务充值中心'

# 发送带图片的消息
curl -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendPhoto" \
  -F "chat_id=${CHAT_ID}" \
  -F "photo=${IMAGE_URL}" \
  -F "caption=${MESSAGE}" \
  -F "parse_mode=HTML"

echo "永劫无间充值消息已发送到北苍星际速充群组 $(date)" >> ~/.openclaw/workspace/logs/naraka-cron.log
