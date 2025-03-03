#!/bin/bash

# لیست سرویس‌ها و پورت‌ها
services=(
  "bank-destination"
  "bank-source"
  "gateway-api"
  "hub-shaparak"
  "psp"
  "shaparak"
  "shetab"
)

# اجرای هر سرویس در یک ترمینال جدید
for service in "${services[@]}"; do
  echo "🚀 Starting $service ..."
  cd services/$service
  npm install # اگر پکیج‌ها نصب نشده، نصب می‌کنه
  npm run start:dev & # اجرا در پس‌زمینه
  cd ../..
  sleep 2 # برای اطمینان از راه‌اندازی سرویس
done

echo "✅ All services started!"