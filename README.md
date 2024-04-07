### Nekron Network Scanner

📡 **Description**
The Nekron Network Scanner is a Bash script that simplifies network scanning using Nmap. It provides predefined scan options for common scenarios, making it easy to perform targeted scans on specific hosts or networks.

🚀 **Features**
- **Quick Scan:** Fast scan with minimal information (`-T4 -F`).
- **Full Scan:** Comprehensive scan with detailed information (`-T4 -A -v`).
- **UDP Scan:** Scan for UDP services (`-sU`).
- **Intense Scan:** Intensive scan with version detection (`--version-all`).
- **Stealth Scan:** Stealthy scan using SYN packets (`-sS -A -T4`).

🛠️ **Installation**
1. Ensure Nmap is installed on your system (`sudo apt-get install nmap` for Ubuntu/Debian).
2. Clone or download the script to your local machine:
   ```bash
   git clone https://github.com/your-username/nekron-network-scanner.git
   ```
3. Navigate to the script directory:
   ```bash
   cd nekron-network-scanner
   ```
4. Make the script executable:
   ```bash
   chmod +x nekron_network_scanner.sh
   ```

🔧 **Usage**
1. Run the script in a terminal:
   ```bash
   ./nekron_network_scanner.sh
   ```
2. Enter the target IP address or hostname when prompted.
3. Choose from the menu options (1-15) to perform the desired scan.

📋 **Requirements**
- Linux operating system (recommended).
- Nmap installed on the system.

⚠️ **Disclaimer**
This script is provided for educational purposes only. Use it responsibly and ensure you have authorization before scanning any network or host that you do not own.
