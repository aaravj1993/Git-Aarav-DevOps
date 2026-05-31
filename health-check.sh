#!/bin/bash
echo "=============================="
echo "Server Health Check"
echo "=============================="
echo "Date: $(date)"
echo "User: $(whoami)"
echo "Disk: $(df -h / | tail -1 | awk '{print $5}')"
echo "Memory: $(free -h | grep Mem | awk '{print $3}')"
echo "Load: $(uptime | awk -F'load average:' '{print $2}')"
