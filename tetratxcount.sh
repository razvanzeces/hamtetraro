#!/bin/bash

function check_svxlink_log() {
    # Check if the svxlink.log file exists
    if [ ! -f "/etc/svxlink/svxlink.log" ]; then
        echo "Error: svxlink.log file not found"
        return 1
    fi
    
    # Count the occurrences of the text "Tx1: Turning the transmitter ON"
    count=$(grep -c "Tx1: Turning the transmitter ON" /etc/svxlink/svxlink.log)
    
    # Get the age of the svxlink.log file
    age=$(stat -c %Y /etc/svxlink/svxlink.log)
    current_time=$(date +%s)
    age_in_seconds=$((current_time - age))
    
    # Convert the age to a human-readable format
    age_formatted=$(date -d @$age +%Y-%m-%d\ %H:%M:%S)
    
    # Send the count and age of the file via Telegram message
    # Replace <TELEGRAM_API_TOKEN> and <CHAT_ID> with your own values
    curl -s -X POST "TELEGRAM-BOT-TOKEN" \
        -d chat_id="TELEGRAM-CHAT-ID" \
        -d text="De la ultima stergere a fisierului de LOG, au fost inregistrate $count de porniri a TX-ului statiei care deserveste nodul TETRA. Vechimea fisierului de LOG-uri este: $$
}

# Call the function
check_svxlink_log
