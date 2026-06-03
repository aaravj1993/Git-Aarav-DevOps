#!/bin/bash
# Azure Monitor Health Check Script
# Checks CPU, Memory and Disk and logs alerts

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'.' -f1)
MEM=$(free | awk '/Mem/{printf("%.0f"), $3/$2*100}')
DISK=$(df / | awk 'NR==2{print $5}' | tr -d '%')

echo "=== Azure Monitor Health Check ==="
echo "CPU Usage: ${CPU}%"
echo "Memory Usage: ${MEM}%"
echo "Disk Usage: ${DISK}%"

if [ "$CPU" -gt 80 ]; then
  echo "ALERT: CPU above 80%"
fi

if [ "$DISK" -gt 80 ]; then
  echo "ALERT: Disk above 80%"
fi
