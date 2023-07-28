#!/bin/bash

# Function to check the dimension of a file and perform necessary actions
check_file_dimension() {
    file_path="/etc/svxlink/svxlink.log"
    clone_folder="/etc/svxlink/rezervelog"
    max_size=1048576  # 1MB in bytes
    
    # Check if the file exists
    if [ -f "$file_path" ]; then
        # Get the file size in bytes
        file_size=$(stat -c%s "$file_path")

        # Compare the file size with the maximum size
        if [ "$file_size" -gt "$max_size" ]; then
            # Create the clone folder if it doesn't exist
            mkdir -p "$clone_folder"

            # Create a timestamp for the clone file name
            timestamp=$(date +"%Y%m%d%H%M%S")

            # Create the clone file with timestamp in the clone folder
            cp "$file_path" "$clone_folder/svxlink_${timestamp}.log"

            # Clear the original file
            > "$file_path"

            # Send an alert message through Telegram API
            # Replace <telegram_token> and <chat_id> with your own values
            curl -s -X POST "https://api.telegram.org/bot6082305296:AAEX4rMzfmJAC6b5D2Jjf2STeHS-kLF5z6w/sendMessage" \
                -d chat_id="-1001970242244" \
                -d text="The svxlink.log file exceeded 1MB and has been cleared. A clone has been created."

            echo "File dimension check completed successfully."
        else
            echo "File dimension is within the limit."
        fi
    else
        echo "File does not exist."
fi
}

# Call the function
check_file_dimension
