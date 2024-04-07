#!/bin/bash

# Function to display the menu
display_menu() {
    clear
    echo "===== Nekron Network Scanner ====="
    echo "1. Quick Scan (-T4 -F)"
    echo "2. Full Scan (-T4 -A -v)"
    echo "3. UDP Scan (-sU)"
    echo "4. Intense Scan (-T4 -A -v --version-all)"
    echo "5. Stealth Scan (-sS -A -T4)"
    echo "6. Service Version Scan (-sV)"
    echo "7. OS Detection Scan (-O)"
    echo "8. Aggressive Scan (-A)"
    echo "9. Fast Scan (-F)"
    echo "10. Ping Scan (-sn)"
    echo "11. Custom Script Scan (-sC)"
    echo "12. TCP SYN Ping Scan (-PS)"
    echo "13. UDP Ping Scan (-PU)"
    echo "14. ACK Ping Scan (-PA)"
    echo "15. Exit"
    echo "================================="
}

# Function to check if sudo is needed for the scan
check_sudo() {
    local scan_command="$1"
    if [[ "$scan_command" == *"nmap -O"* ]]; then
        return 0  # Sudo required
    fi
    return 1  # Sudo not required
}

# Function to perform a scan
perform_scan() {
    echo -n "$1..."
    if check_sudo "$2"; then
        if sudo -n true 2>/dev/null; then
            sudo -E $2  # Use -E to preserve environment variables
        else
            echo "Error: You must run this script with sudo."
            exit 1
        fi
    else
        $2
    fi
    echo " Done"
    pause
}

# Function to pause after scan completion
pause() {
    read -n 1 -s -r -p "Press any key to return to the menu..."
}

# Main script
echo "Enter the target IP or hostname:"
read -r target

while true; do
    display_menu
    read -rp "Select an option (1-15): " choice
    case $choice in
        1) perform_scan "Running Quick Scan" "nmap -T4 -F $target" ;;
        2) perform_scan "Running Full Scan" "nmap -T4 -A -v $target" ;;
        3) perform_scan "Running UDP Scan" "nmap -sU $target" ;;
        4) perform_scan "Running Intense Scan" "nmap -T4 -A -v --version-all $target" ;;
        5) perform_scan "Running Stealth Scan" "nmap -sS -A -T4 $target" ;;
        6) perform_scan "Running Service Version Scan" "nmap -sV $target" ;;
        7) perform_scan "Running OS Detection Scan" "nmap -O $target" ;;
        8) perform_scan "Running Aggressive Scan" "nmap -A $target" ;;
        9) perform_scan "Running Fast Scan" "nmap -F $target" ;;
        10) perform_scan "Running Ping Scan" "nmap -sn $target" ;;
        11) perform_scan "Running Custom Script Scan" "nmap -sC $target" ;;
        12) perform_scan "Running TCP SYN Ping Scan" "nmap -PS $target" ;;
        13) perform_scan "Running UDP Ping Scan" "nmap -PU $target" ;;
        14) perform_scan "Running ACK Ping Scan" "nmap -PA $target" ;;
        15) echo "Exiting..."; exit ;;
        *) echo "Invalid option. Please choose again." ;;
    esac
done
