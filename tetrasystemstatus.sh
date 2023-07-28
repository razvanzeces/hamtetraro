                                                                              

#!/bin/bash

function send_telegram_alert() {
    # Function to send a Telegram alert with the provided message
    # Usage: send_telegram_alert <message>
    local message="$1"
    local telegram_token="TELEGRAM-BOT-TOKEN"
    local chat_id="TELEGRAM-CHAT-ID"
    
    # Send the message using the Telegram Bot API
    curl -s -X POST "https://api.telegram.org/bot${telegram_token}/sendMessage" \
        -d "chat_id=${chat_id}" \
        -d "text=${message}"
}

function check_system_status() {
    # Function to check the system status and send a Telegram alert with the information
    
    # Get CPU status
    local cpu_status=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
    # Get RAM memory usage
    local ram_usage=$(free -m | awk '/Mem:/ {print $3}')
    
    # Get disk usage in directory /
    local disk_usage=$(df -h / | awk '/\// {print $5}')
    
    # Get system uptime
    local uptime=$(uptime -p)
    
    # Check if svxlink service is running and since when
    local svxlink_status=$(systemctl is-active svxlink)
    local svxlink_since=$(systemctl show -p ActiveEnterTimestamp svxlink | awk -F= '{print $2}')
    
    # Get CPU temperature
    local cpu_temp=$(sensors | awk '/^Package/ {print $4}')
    
    # Prepare the message with all the information
    local message="STATUS NOD TETRA NAZNA:
Utilizare CPU: ${cpu_status}%
Utilizare RAM: ${ram_usage} MB din 256MB
Utilizare Disk: ${disk_usage}
Uptime: ${uptime}
Svxlink Status: ${svxlink_status}
Svxlink pornit din: ${svxlink_since}"
    
    # Send the message as a Telegram alert
    send_telegram_alert "$message"
}

# Call the function to check the system status
check_system_status
